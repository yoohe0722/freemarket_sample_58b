class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :trading_condition, :integer, :default => 1
  end
end
