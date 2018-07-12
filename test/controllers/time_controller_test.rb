require 'test_helper'

class TimeControllerTest < ActionDispatch::IntegrationTest
  test "should get timeTableGet" do
    get time_timeTableGet_url
    assert_response :success
  end

  test "should get timeTablePost" do
    get time_timeTablePost_url
    assert_response :success
  end

end
