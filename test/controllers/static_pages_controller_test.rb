require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "FMF's Sample App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | FMF's Sample App"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | FMF's Sample App"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | FMF's Sample App"
  end
end
