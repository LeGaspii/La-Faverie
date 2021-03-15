class CreateUsersfamillies < ActiveRecord::Migration[6.0]
  def change
    create_table :usersfamillies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :familly, null: false, foreign_key: true

      t.timestamps
    end
  end
end
