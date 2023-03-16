require "test_helper"

class SassControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get sass_home_url
    assert_response :success
  end
end
