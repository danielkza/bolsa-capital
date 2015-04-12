class InvestorOffer < ActiveRecord::Base
  belongs_to :investor
  belongs_to :merchant_offer

  validates_presence_of :investor_id, :merchant_offer_id, :fee
  validates_associated :investor, :merchant_offer

  def accept
    if accepted_at or merchant_offer.accepted_at
      errors.add("Offer already accepted")
      false
    else
      merchant_offer.accepted_at = self.accepted_at = DateTime.now
      merchant_offer.save
      save
    end
  end
end
