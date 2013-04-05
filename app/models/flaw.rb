class Flaw < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  def self.need_to_check(check_when = 'now')
    where("datetime(?) >datetime(strftime('%s', updated_at) + refreshes_every, 'unixepoch')", check_when)
  end

  def site_name=(name)
    name, url = name.split('<')
    self.site = Site.where(name: name).first_or_create(url_fragment: url.gsub('>', ''))
  end

  def site_name
    self.site.try(:name)
  end

  def recurs_every=(hours)
    self.refreshes_every = hours.to_f.hours
  end

  def recurs_every
    self.refreshes_every.try(:hours)
  end
end
