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

  test 'username and password authentication' do
    user = users(:dugancathal_nofb)
    assert_respond_to user, :password_digest
    assert_respond_to user, :password
    assert_respond_to user, :password_confirmation
    assert_respond_to user, :authenticate
  end

  test 'sizing of facebook url based profile pics' do
    user = users(:dugancathal)
    assert_match /height=25/, user.profile_picture(25, 25)
    assert_match /width=25/, user.profile_picture(25, 25)
  end
end
