require 'test_helper'

class FlawTest < ActiveSupport::TestCase
  fixtures :all
  test 'need to check' do
    assert_equal [flaws(:"37signals")], Flaw.need_to_check
    assert_equal [flaws(:"37signals"), flaws(:xkcd)].sort_by{|f| f.id}, 
      Flaw.need_to_check(2.days.from_now).order(:id).to_a
  end
end
