class ProcessedPayment < ActiveRecord::Base
  self.primary_key = :payment_id

  validates_uniqueness_of :payment_id
end
