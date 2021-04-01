class AddColumnRoomsToPerks < ActiveRecord::Migration[6.0]
  def change
    add_reference :perks, :room, null: false, foreign_key: true
  end
end
