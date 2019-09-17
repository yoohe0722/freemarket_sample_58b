class Item < ApplicationRecord
  

  has_many_attached :images
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :user
end
