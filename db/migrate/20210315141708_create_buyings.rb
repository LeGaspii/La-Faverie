class CreateBuyings < ActiveRecord::Migration[6.0]
  def change
    create_table :buyings do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.integer :number
      t.integer :value

      t.timestamps
    end
  end
end
