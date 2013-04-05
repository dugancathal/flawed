class User < ActiveRecord::Base
  has_secure_password

  validates :provider, presence: true, unless: :username

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.profile_pic = auth.info.image
      user.password = SecureRandom.hex(6)
      user.password_confirmation = user.password
      user.save!
    end
  end
end
