class RenameShipMethodColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :ship_method, :shipmethod_id
  end
end
