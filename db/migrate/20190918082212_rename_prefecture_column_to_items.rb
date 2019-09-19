class RenamePrefectureColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :prefecture, :prefecture_id
  end
end
