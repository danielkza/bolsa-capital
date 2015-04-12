class AddUsedAtToBadCard < ActiveRecord::Migration
  def change
    add_column :bad_cards, :used_at, :datetime
  end
end
