class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :path
      t.integer :item_id, foreign_key: true

      t.timestamps
    end
  end
end
