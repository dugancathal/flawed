require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  test 'creation by full url' do
    site = Site.from_url url: 'http://facebook.com'
    assert_equal 'http://facebook.com', site.url.to_s
  end

  test 'creation by scheme-less url' do
    site = Site.from_url url: 'facebook.com'
    assert_equal 'http://facebook.com', site.url.to_s
  end

  test 'creation with invalid url' do
    site = Site.from_url url: 'http://'
    assert site.errors.size > 0
    assert !site.valid?
  end
end
