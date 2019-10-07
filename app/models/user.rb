class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  has_many :payments
  has_many :items
  has_many :authorizations

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    authorization = Authorization.where(uid: uid, provider: provider).first
    if authorization.present?
      user = User.where(id: authorization.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        Authorization.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        password = Devise.friendly_token[0, 20]
        user = User.new(
          nick_name: auth.info.name,
          email:    auth.info.email,
          password: password,
          password_confirmation: password
          )
        Authorization.create(
          uid: uid,
          provider: provider
          )
      end
    end
    return user
  end
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_ZIP_REGEX = /\A\d{7}\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :nick_name, presence: true, length: { maximum: 20}
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }, uniqueness: true
  validates :zip, presence: true, format: { with: VALID_ZIP_REGEX }
  validates :family_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :family_name, :first_name, :family_kana, :first_kana, :birth_year, :birth_month, :birth_day, :zip, :prefecture_id, :city, :block, presence: true
end