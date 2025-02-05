require "test_helper"

class Admin::ItemReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_item_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_item_reviews_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_item_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_item_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_item_reviews_destroy_url
    assert_response :success
  end
end
