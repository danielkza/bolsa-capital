class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :name
      t.text :code
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
