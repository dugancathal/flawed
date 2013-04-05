require 'test_helper'

class FlawsControllerTest < ActionController::TestCase
  fixtures :users
  def setup
    session[:user_id] = users(:dugancathal).id
  end

  test 'posts create' do
    post :create, flaw: {recurs_every: 9, site_name: 'The Oatmeal<theoatmeal.com>'}
    assert_response :redirect
  end
end
