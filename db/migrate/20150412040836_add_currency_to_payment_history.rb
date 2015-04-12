class AddCurrencyToPaymentHistory < ActiveRecord::Migration
  def change
    add_column :payment_histories, :currency, :string
  end
end
