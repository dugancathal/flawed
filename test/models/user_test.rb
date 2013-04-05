require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'from_omniauth should return a new user' do
    user = User.from_omniauth(facebook_auth)
    assert_equal facebook_auth.info.name, user.name
    assert_equal facebook_auth.provider, user.provider
    assert_equal facebook_auth.uid, user.uid
  end

  test 'from_omniauth should return a valid user' do
    user = User.from_omniauth(facebook_auth)
    assert user.valid?
  end

  test 'profile_pic returns a url to a picture' do
    user = users(:dugancathal)
    uri = URI.parse(user.profile_pic)
    assert_not_nil user.profile_pic
    assert_kind_of URI::HTTP, uri
  end
end
