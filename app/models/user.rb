class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:discord]

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    unless user
      user = User.create(
        discriminator: access_token.extra.raw_info.discriminator,
        uid: access_token.extra.raw_info.id,
        avatar: access_token.extra.raw_info.avatar,
        username: access_token.extra.raw_info.username,
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
