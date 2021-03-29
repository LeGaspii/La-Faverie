class AddColumnToPerks < ActiveRecord::Migration[6.0]
  def change
    add_column :perks, :name, :string
    add_column :perks, :number, :integer
  end
end
