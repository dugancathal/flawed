require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users
  def setup
    @user = users(:dugancathal)
  end

  test 'gets show' do
    get :show, {id: @user.id}
    assert_response :success
  end

  test 'user page shows username' do
    get :show, {id: @user.id}
    assert_select 'img.profile-pic'
  end

  test 'user page assigns user' do
    get :show, {id: @user.id}
    assert_not_nil assigns(:user)
  end
end
