class CreateInvestorOffers < ActiveRecord::Migration
  def change
    create_table :investor_offers do |t|
      t.references :investor, index: true, foreign_key: true
      t.references :merchant_offer, index: true, foreign_key: true
      t.decimal :fee
      t.datetime :accepted_at

      t.timestamps null: false
    end
  end
end
