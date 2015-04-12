class CreatePaymentHistories < ActiveRecord::Migration
  def change
    create_table :payment_histories do |t|
      t.references :merchant, index: true, foreign_key: true
      t.integer :month
      t.integer :year
      t.decimal :total_received

      t.timestamps null: false

      t.index [:month, :year], unique: true
    end
  end
end
