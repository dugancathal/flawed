class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  has_secure_password validations: false

  # with_options unless: :provider do |password_user|
    # validates :password, presence: true
    # validates :username, presence: true
  # end

  validates :provider, presence: true, unless: :username

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.profile_pic = auth.info.image
      user.save!
    end
  end
end
