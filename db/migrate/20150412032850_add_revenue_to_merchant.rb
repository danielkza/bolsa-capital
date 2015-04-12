class AddRevenueToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :revenue, :decimal
  end
end
