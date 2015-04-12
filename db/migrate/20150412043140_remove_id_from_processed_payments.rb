class RemoveIdFromProcessedPayments < ActiveRecord::Migration
  def change
    change_table :processed_payments do |t|
      t.change :payment_id, :string, null: false
      t.remove :id, :string
    end
  end
end
