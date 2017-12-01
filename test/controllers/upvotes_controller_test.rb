require 'test_helper'

class UpvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get upvotes_new_url
    assert_response :success
  end

  test "should get create" do
    get upvotes_create_url
    assert_response :success
  end

  test "should get update" do
    get upvotes_update_url
    assert_response :success
  end

  test "should get edit" do
    get upvotes_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get upvotes_destroy_url
    assert_response :success
  end

  test "should get index" do
    get upvotes_index_url
    assert_response :success
  end

  test "should get show" do
    get upvotes_show_url
    assert_response :success
  end

end
