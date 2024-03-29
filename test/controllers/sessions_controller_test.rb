require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
  end

  test 'posts create is successful' do
    post :fb_create
    assert_response :redirect
    assert_redirected_to user_path(assigns(:user))
  end

  test 'create establishes user_id in session' do
    post :fb_create
    assert_not_nil session[:user_id]
  end

  test 'create will create or update a user' do
    post :fb_create
    assert_not_nil assigns(:user)
    assert_equal facebook_auth[:info][:name], assigns(:user).name
  end
end
