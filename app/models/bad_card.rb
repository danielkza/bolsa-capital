class BadCard < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :merchant_id, :card, :status, :used_at
  validates_associated :merchant
end
