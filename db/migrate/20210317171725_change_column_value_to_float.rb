class ChangeColumnValueToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :buyings, :value, :float
  end
end
