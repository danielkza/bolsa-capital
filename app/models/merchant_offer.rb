class MerchantOffer < ActiveRecord::Base
  belongs_to :merchant
  has_many :investor_offers

  validates_presence_of :merchant_id, :amount, :starts, :ends
  validates_associated :merchant

  validate do |o|
    errors.add("Invalid date range") if o.starts && o.ends && o.ends < o.starts
    errors.add("Invalid date pay range") if o.accepted_at && o.repaid_at && o.repaid_at < o.accepted_at
  end

  def accepted_investor_offer
    investor_offers.where.not(:accepted_at => nil).first
  end
end
