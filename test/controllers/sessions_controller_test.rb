require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def facebook_auth
    {
      provider: 'facebook',
      uid: '1234567',
      info: {name: 'TJ'},
      credentials: { expires_at: (Time.now + 2.hours).to_i, token: 'AAABBBBCCC'}
    }
  end

  test 'posts create is successful' do
    post :create
  end

  test 'create establishes user_id in session' do
    assert_not_nil session[:user_id]
  end

  test 'create will create or update a user' do
    assert_not_nil assigns(:user)
    assert_equal facebook_auth[:info][:name], assigns(:user).name
  end
end
