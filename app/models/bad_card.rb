class BadCard < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :merchant_id, :card
  validates_associated :merchat
end
