class AddColumnToFamilly < ActiveRecord::Migration[6.0]
  def change
    add_column :famillies, :nom, :string
    add_column :famillies, :prenom, :string
    add_reference :famillies, :user, null: false, foreign_key: true
  end
end
