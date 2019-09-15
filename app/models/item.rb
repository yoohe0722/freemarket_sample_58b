class Item < ApplicationRecord
  belongs_to :category
  belongs_to :size
  belongs_to :brand
end
