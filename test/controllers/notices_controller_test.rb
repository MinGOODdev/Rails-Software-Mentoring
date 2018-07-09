require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notices_index_url
    assert_response :success
  end

  test "should get new" do
    get notices_new_url
    assert_response :success
  end

  test "should get create" do
    get notices_create_url
    assert_response :success
  end

  test "should get show" do
    get notices_show_url
    assert_response :success
  end

  test "should get delete" do
    get notices_delete_url
    assert_response :success
  end

end
