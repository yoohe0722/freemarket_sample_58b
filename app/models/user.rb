class User < ApplicationRecord
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
        user = User.create(
          nick_name: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          phone_number: "08000000000"
          )
          Authorization.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
