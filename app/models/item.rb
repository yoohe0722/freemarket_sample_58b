class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipdate
  belongs_to_active_hash :shipfee
  belongs_to_active_hash :shipmethod
  belongs_to_active_hash :condition
end
