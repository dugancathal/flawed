require 'test_helper'

class ScreenshotThumbnailTest < ActiveSupport::TestCase
  fixtures :sites
  test 'to_url generates correct hash' do
     site = SiteThumbnail.new(sites(:xkcd))
     passphrase = "#{sites(:xkcd).url}#{SiteThumbnail::SECRET}"
     hash = Digest::MD5.new << passphrase
     assert_equal hash, site.secret_hash
  end
end
