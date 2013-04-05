require 'test_helper'

class FlawTest < ActiveSupport::TestCase
  fixtures :all
  test 'need to check' do
    assert_equal [flaws(:"37signals")], Flaw.need_to_check
    assert_equal [flaws(:"37signals"), flaws(:xkcd)].sort_by{|f| f.id}, 
      Flaw.need_to_check(2.days.from_now).order(:id).to_a
  end

  test 'creation by site name and recurrence' do
    params = {site_name: 'The Oatmeal<theoatmeal.com>', recurs_every: 24}
    flaw = Flaw.create params
    assert flaw.valid?
    assert_equal flaw.refreshes_every, 24.hours
    assert_equal flaw.site.name, 'The Oatmeal'
    assert_equal flaw.site.url, 'theoatmeal.com'
  end
end
