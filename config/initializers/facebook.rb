require 'facebook'
Facebook::Config.from_yaml_file(Rails.root.join('config/facebook.yml'))
