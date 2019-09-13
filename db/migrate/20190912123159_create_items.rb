class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.text :description, null: false
      t.string :condition, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.integer :size_id, foreign_key: true
      t.text :image_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id, foreign_key: true
      t.integer :prefecture, null: false
      t.string :ship_fee, null: false
      t.integer :ship_method, null: false
      t.integer :ship_date, null: false
      t.string :trading_condition
      t.timestamps
    end
  end
end
