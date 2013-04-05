require 'facebook'
Facebook::Config.from_yaml_file(Rails.root.join('config/facebook.yml'))

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Facebook::Config['app_id'], Facebook::Config['secret']
end
