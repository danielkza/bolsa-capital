class AddMerchantToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :merchant_identifier, :string
  end
end
