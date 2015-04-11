class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.text :code
      t.integer :owner_id
      t.text :address

      t.timestamps null: false
    end
  end
end
