class CreateUsersprojects < ActiveRecord::Migration[6.0]
  def change
    create_table :usersprojects do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
