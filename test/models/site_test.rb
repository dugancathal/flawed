require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  test 'creation by url' do
    site = Site.from_url url: 'facebook.com'
    assert_equal 'http://facebook.com', site.url.to_s
  end
end
