require 'addressable/uri'

class Site < ActiveRecord::Base
  validates :url, :name, presence: true

  def self.from_url(params = {})
    url = Addressable::URI.heuristic_parse(params[:url])
    params.merge!(url: url.to_s)
    Site.new(params)
  rescue Addressable::URI::InvalidURIError
    Site.new.tap {|site| site.errors[:url] << 'The URL must be a valid HTTP(s) address'}
  end
end
