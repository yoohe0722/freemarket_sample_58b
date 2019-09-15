class ChangeDatatypeBrandGroupIdOfBrands < ActiveRecord::Migration[5.2]
  def change
    change_column :brands, :brand_group_id, :integer
  end
end
