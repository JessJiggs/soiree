require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get first_name:" do
    get guests_first_name:_url
    assert_response :success
  end

  test "should get last_name:" do
    get guests_last_name:_url
    assert_response :success
  end

  test "should get email_address:" do
    get guests_email_address:_url
    assert_response :success
  end

  test "should get phone_number:" do
    get guests_phone_number:_url
    assert_response :success
  end

  test "should get invite_status:boolean" do
    get guests_invite_status:boolean_url
    assert_response :success
  end

  test "should get rsvp_status:boolean" do
    get guests_rsvp_status:boolean_url
    assert_response :success
  end
end
