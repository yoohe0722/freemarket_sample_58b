class Brand < ApplicationRecord
  has_many :items
  belongs_to :brand_group, optional: true

end
