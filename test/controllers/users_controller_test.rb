require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  def user_params
    {
      username: 'dugancathal',
      password: 'secret',
      password_confirmation: 'secret',
      name: 'TJ Taylor',
    }
  end

  def setup
    @user = users(:dugancathal)
  end

  test 'gets show' do
    get :show, {id: @user.id}
    assert_response :success
  end

  test 'user page assigns user' do
    get :show, {id: @user.id}
    assert_not_nil assigns(:user)
  end

  test 'gets new' do
    get :new
    assert_not_nil assigns(:user)
    assert_select 'form' do
      assert_select '#user_username'
      assert_select '#user_password'
    end
  end

  test 'posts create' do
    post :create, user: user_params
    assert_not_nil assigns(:user)
    assert_redirected_to user_path(assigns(:user))
  end
end
