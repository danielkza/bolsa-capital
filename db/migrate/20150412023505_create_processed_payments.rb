class CreateProcessedPayments < ActiveRecord::Migration
  def change
    create_table :processed_payments do |t|
      t.string :payment_id
      t.index :payment_id, unique: true
    end
  end
end
