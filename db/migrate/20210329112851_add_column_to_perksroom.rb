class AddColumnToPerksroom < ActiveRecord::Migration[6.0]
  def change
    add_column :perksrooms, :number, :integer
  end
end
