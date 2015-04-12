class Investor < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :offers, class_name: "InvestorOffer"

  validates_presence_of :name, :code, :owner_id
  validates_associated :owner
  validates_uniqueness_of :code
end
