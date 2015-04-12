require 'net/http'
require 'simplify'

class Merchant < ActiveRecord::Base
  STOLEN_CARD_SERVICE_URI = URI('http://dmartin.org:8011/fraud/loststolen/v1/account-inquiry?Format=XML')

  belongs_to :owner, class_name: 'User'
  has_many :payment_histories
  has_many :offers, class_name: "MerchantOffer"
  has_many :bad_cards

  validates_presence_of :name, :code, :owner_id, :address
  validates_associated :owner
  validates_uniqueness_of :code

  def check_card_lost_stolen(card_number, http)
    req = Net::HTTP::Post.new(STOLEN_CARD_SERVICE_URI)
    req.set_content_type('application/xml')
    req.body = <<-XML
<AccountInquiry>
	<AccountNumber>#{card_number}</AccountNumber>
</AccountInquiry>
XML
    res = http.request(req)
    p res.body
    if res.code.to_i >= 200 && res.code.to_i < 300
      reason = res.body.match(/<Reason>(.+?)<\/Reason>/).captures.first
      p reason
      return reason
    end

    nil
  end

  def process_all_payments!
    auth = if access_token
      Simplify::Authentication(access_token) if access_token
    else
      nil
    end

    total = nil
    current = 0

    while ! total or current < total
      res = Simplify::Payment.list({'max' => 50, 'offset' => current}, *auth)
      total = res['total']
      current += res['list'].size

      res['list'].each do |p|
        p process_payment(payment_id: p['id'], currency: p['currency'],
          amount: p['amount'] / 100, timestamp: p['paymentDate'],
          card_number: p['card']['number'])
      end
    end

  end

  def process_payment(payment_id:, currency:, amount:, timestamp:, card_number:, http: nil)
    existing = ProcessedPayment.find_by_payment_id(payment_id)
    return nil if existing

    logger.debug "Processing payment " + payment_id

    time = Time.at(timestamp / 1000.0).utc
    history = PaymentHistory.find_or_create_by(merchant: self,
      currency: currency, year: time.year, month: time.month)
    history.total_received ||= 0
    history.total_received += amount
    res = history.save

    http ||= Net::HTTP.new(STOLEN_CARD_SERVICE_URI.host,
                           STOLEN_CARD_SERVICE_URI.port)
    p check_card_lost_stolen(card_number, http)

    ProcessedPayment.create(payment_id: payment_id) if res
    res
  end
end
