class AddAccessTokenToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :access_token, :string
  end
end
