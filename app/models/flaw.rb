class Flaw < ActiveRecord::Base
  attr_accessor :site_name
  belongs_to :site
  belongs_to :user

  def self.need_to_check(check_when = 'now')
    where("datetime(?) >datetime(strftime('%s', updated_at) + refreshes_every, 'unixepoch')", check_when)
  end
end
