class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
end
