require 'test_helper'

class FacebookConfigTest < ActiveSupport::TestCase
  def setup
    @config_file = Rails.root.join('test', 'fixtures', 'facebook_yml.txt').to_s
  end

  test 'parsing from filename' do
    conf = Facebook::Config.from_yaml_file(@config_file)
    assert_kind_of Hash, conf
  end

  test 'hash-style access of config params' do
    Facebook::Config.from_yaml_file(@config_file)
    assert_equal Facebook::Config['app_id'], 125654034290050
  end
end
