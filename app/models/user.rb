class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :payments
  has_many :items
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :nick_name, presence: true, length: { maximum: 20}
  # validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  # validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :family_name, :first_name, :family_kana, :first_kana, :birth_year, :birth_month, :birth_day, :phone_number, :zip, :prefecture_id, :city, :block, presence: true
end
