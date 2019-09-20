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

  validates :name, presence: true, length: { maximum: 40}
  validates :description, presence: true, length: { maximum: 100} #テストしやすいよう本家とは異なる設定
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 99999999 }
  with_options presence: true do
    # validates :image
    validates :category_id
    validates :prefecture_id
    validates :shipdate_id
    validates :shipfee_id
    validates :shipmethod_id
    validates :condition_id
    validates :user_id
  end
end
