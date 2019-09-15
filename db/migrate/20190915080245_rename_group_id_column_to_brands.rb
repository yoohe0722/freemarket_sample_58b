class RenameGroupIdColumnToBrands < ActiveRecord::Migration[5.2]
  def change
    rename_column :brands, :group_id, :brand_group_id
  end
end
