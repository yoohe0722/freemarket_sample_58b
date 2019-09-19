class RenameShipFeeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :ship_fee, :shipfee_id
  end
end
