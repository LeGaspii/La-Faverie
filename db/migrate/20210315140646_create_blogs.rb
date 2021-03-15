class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.references :house, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
