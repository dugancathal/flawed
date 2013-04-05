class User < ActiveRecord::Base
  has_secure_password

  has_many :flaws, dependent: :destroy
  has_many :sites, through: :flaws

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

  def profile_picture(width, height)
    if profile_pic =~ /graph.facebook.com/
      options = {width: width, height: height}
      url = URI.parse(profile_pic)
      url.query = options.to_query
      url.to_s
    else
      profile_pic
    end
  end
end
