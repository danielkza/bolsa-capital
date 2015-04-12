require 'openssl'

require 'simplify'
require 'mastercard/services/lost_stolen/LostStolenService'

class Merchant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :payment_histories
  has_many :offers, class_name: "MerchantOffer"
  has_many :bad_cards

  validates_presence_of :name, :code, :owner_id, :address
  validates_associated :owner
  validates_uniqueness_of :code

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
                          amount: p['amount'] / 100,
                          timestamp: p['reference'] || p['paymentDate'],
                          card_number: p['card']['number'])
      end
    end

  end

  def process_payment(payment_id:, currency:, amount:, timestamp:, card_number: nil)
    existing = ProcessedPayment.find_by_payment_id(payment_id)
    return nil if existing

    logger.debug "Processing payment " + payment_id

    time = Time.at(timestamp / 1000.0).utc
    history = PaymentHistory.find_or_create_by(merchant: self,
      currency: currency, year: time.year, month: time.month)
    history.total_received ||= 0
    history.total_received += amount
    res = history.save

    check_card_lost_stolen(card_number, time) if card_number

    ProcessedPayment.create(payment_id: payment_id) if res
    res
  end

  def check_card_lost_stolen(card_number, time)
    @lost_stolen_service ||= Mastercard::Services::LostStolen::LostStolenService.new(
      'bNhAMZEI3MeC89rtl_Q5CiyDSTich5ClsnZ-kUpIea5d95e0!4f3157734a5451574a6b5332784a4c445a45504966673d3d',
      OpenSSL::PKCS12.new(File.open(Rails.root.join('key.p12')), 'bbnlbkxx').key,
      'sandbox'
    )

    res = @lost_stolen_service.get_account(card_number)
    if res and res.reason
      self.bad_cards.create(card: card_number, status: res.reason, used_at: time)
    end

    nil
  end
end
