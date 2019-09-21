class AddDefaultToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :nick_name, true
    change_column_null :users, :family_name, true
    change_column_null :users, :family_kana, true
    change_column_null :users, :first_name, true
    change_column_null :users, :first_kana, true
    change_column_null :users, :birth_year, true
    change_column_null :users, :birth_month, true
    change_column_null :users, :birth_day, true
    change_column_null :users, :phone_number, true
    change_column_null :users, :zip, true
    change_column_null :users, :prefecture_id, true
    change_column_null :users, :city, true
    change_column_null :users, :block, true
    change_column_null :users, :building, true
  end
end
