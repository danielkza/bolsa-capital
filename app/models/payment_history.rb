class PaymentHistory < ActiveRecord::Base
  belongs_to :merchant
  validates_uniqueness_of :month, scope: :year
  validates_presence_of :total_received
  validate do |p|
    p.errors.add(:base, 'Total received must be positive') if p.total_received && p.total_received < 0
  end
end
