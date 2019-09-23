class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :user, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipdate
  belongs_to_active_hash :shipfee
  belongs_to_active_hash :shipmethod
  belongs_to_active_hash :condition
  validates :name, presence: true, length: { maximum: 40}
  validates :description, presence: true, length: { maximum: 100} #テストしやすいよう本家とは異なる設定
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 99999999 }
  validates :category_id, :prefecture_id, :shipdate_id, :shipfee_id, :shipmethod_id, :condition_id, :user_id, presence: true
end
