class CreateBadCards < ActiveRecord::Migration
  def change
    create_table :bad_cards do |t|
      t.references :merchant, index: true, foreign_key: true
      t.string :card
      t.string :status

      t.timestamps null: false
    end
  end
end
