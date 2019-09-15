class Item < ApplicationRecord
  belongs_to :category
  belongs_to :size
  mount_uploader :image, ImageUploader
end
