class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_initialize
    user.password = user.password_confirmation = SecureRandom.uuid
    user.name = auth.info.name
    user.google_token = auth.credentials.token

    refresh_token = auth.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save

    user
  end
end
