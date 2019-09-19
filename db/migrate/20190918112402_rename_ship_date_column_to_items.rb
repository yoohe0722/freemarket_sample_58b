class RenameShipDateColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :ship_date, :shipdate_id
  end
end
