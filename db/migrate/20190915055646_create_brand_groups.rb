class CreateBrandGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_groups do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
  end
end
