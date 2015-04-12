require 'simplify'

class Merchant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :payment_histories
  has_many :offers, class_name: "MerchantOffer"

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
                        amount: p['amount'] / 100, timestamp: p['paymentDate'])
      end
    end

  end

  def process_payment(payment_id:, currency:, amount:, timestamp:)
    existing = ProcessedPayment.find_by_payment_id(payment_id)
    return nil if existing

    logger.debug "Processing payment " + payment_id

    time = Time.at(timestamp / 1000.0).utc
    history = PaymentHistory.find_or_create_by(merchant: self,
      currency: currency, year: time.year, month: time.month)
    p history.errors
    history.total_received ||= 0
    history.total_received += amount
    res = history.save
    ProcessedPayment.create(payment_id: payment_id) if res
    res
  end
end
