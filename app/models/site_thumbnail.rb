class SiteThumbnail
  API_KEY = '5fcb43'
  BASE_URL = 'http://api.screenshotmachine.com'
  SECRET = 'correct horse battery staple'

  def initialize(site, options = {})
    @site = site
    @options = options
  end

  def to_url
    base.query = @options.merge({hash: secret_hash, url: @site.url, key: API_KEY}).to_query
    base.to_s
  end

  def secret_hash
    Digest::MD5.new << "#{@site.url}#{SECRET}"
  end

  private

  def base
    @base ||= URI.parse(BASE_URL)
  end
end
