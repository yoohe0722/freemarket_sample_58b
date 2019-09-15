class AddColumnBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands,:group_id, :string
  end
end
