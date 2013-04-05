require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "home has a place to login or signup" do
    get :home
    assert_select '#sign_up'
    assert_select '#sign_in'
  end
end
