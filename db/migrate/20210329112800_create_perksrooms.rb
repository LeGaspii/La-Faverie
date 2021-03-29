class CreatePerksrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :perksrooms do |t|
      t.references :room, null: false, foreign_key: true
      t.references :perk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
