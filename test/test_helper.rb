ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def facebook_auth
    Hashie::Mash.new(
      provider: 'facebook',
      uid: '1234567',
      info: {name: 'TJ Taylor', image: 'http://graph.facebook.com'},
      credentials: { expires_at: (Time.now + 2.hours).to_i, token: 'AAABBBBCCC'}
    )
  end

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = Hashie::Mash.new({
    provider: 'facebook',
    uid: '1234567',
    info: {name: 'TJ Taylor', image: 'http://graph.facebook.com'},
    credentials: { expires_at: (Time.now + 2.hours).to_i, token: 'AAABBBBCCC'}
  })
end
