class AddDefaultPicToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :image, :string, default: "default.jpg" 
  end
end
