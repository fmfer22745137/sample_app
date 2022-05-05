require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal "FMF's Sample App", full_title
    assert_equal "Help | FMF's Sample App", full_title("Help")
  end
end
