class CreateMerchantOffers < ActiveRecord::Migration
  def change
    create_table :merchant_offers do |t|
      t.references :merchant, index: true, foreign_key: true
      t.decimal :amount
      t.datetime :starts
      t.datetime :ends
      t.datetime :accepted_at
      t.datetime :repaid_at

      t.timestamps null: false
    end
  end
end
