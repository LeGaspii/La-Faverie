class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :house, null: false, foreign_key: true
      t.string :name
      t.date :deadline
      t.integer :budget
      t.text :content

      t.timestamps
    end
  end
end
