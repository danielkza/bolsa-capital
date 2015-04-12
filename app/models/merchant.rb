class Merchant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  validates_presence_of :name, :code, :owner_id, :address
  validates_associated :owner
  validates_uniqueness_of :code

  def process_payment(amount, timestamp)
    time = Time.at(timestamp / 1000.0).utc
    history = PaymentHistory.find_or_create_by(merchant: self, year: time.year,
                                               month: time.month)
    history.total_received ||= 0
    history.total_received += amount
    history.save
  end
end
