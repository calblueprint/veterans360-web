require 'test_helper'

class VeteransControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veteran = veterans(:one)
  end

  test "should get index" do
    get veterans_url
    assert_response :success
  end

  test "should get new" do
    get new_veteran_url
    assert_response :success
  end

  test "should create veteran" do
    assert_difference('Veteran.count') do
      post veterans_url, params: { veteran: { email: @veteran.email, first_name: @veteran.first_name, last_name: @veteran.last_name, on_connect: @veteran.on_connect } }
    end

    assert_redirected_to veteran_url(Veteran.last)
  end

  test "should show veteran" do
    get veteran_url(@veteran)
    assert_response :success
  end

  test "should get edit" do
    get edit_veteran_url(@veteran)
    assert_response :success
  end

  test "should update veteran" do
    patch veteran_url(@veteran), params: { veteran: { email: @veteran.email, first_name: @veteran.first_name, last_name: @veteran.last_name, on_connect: @veteran.on_connect } }
    assert_redirected_to veteran_url(@veteran)
  end

  test "should destroy veteran" do
    assert_difference('Veteran.count', -1) do
      delete veteran_url(@veteran)
    end

    assert_redirected_to veterans_url
  end
end
