require "test_helper"

class Admin::FacilityPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_facility_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_facility_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_facility_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_facility_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_facility_posts_destroy_url
    assert_response :success
  end
end
