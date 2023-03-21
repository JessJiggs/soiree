require "test_helper"

class CollaborationControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get collaboration_add_url
    assert_response :success
  end
end
