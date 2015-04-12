class ChangeUniqueIndexFromPaymentHistory < ActiveRecord::Migration
  def change
    remove_index :payment_histories, column: [:month, :year]
    add_index :payment_histories, [:currency, :month, :year], unique: true
  end
end
