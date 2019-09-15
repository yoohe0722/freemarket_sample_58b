class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer  :zip, null: false
      t.integer  :prefecture_id, null: false
      t.string   :city, null: false
      t.string   :block, null: false
      t.string   :building, null: false
      t.integer  :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end