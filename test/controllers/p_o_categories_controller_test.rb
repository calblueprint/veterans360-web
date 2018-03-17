require 'test_helper'

class PartnerCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner_category = partner_categories(:one)
  end

  test "should get index" do
    get partner_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_partner_category_url
    assert_response :success
  end

  test "should create partner_category" do
    assert_difference('POCategory.count') do
      post partner_categories_url, params: { partner_category: {  } }
    end

    assert_redirected_to partner_category_url(PartnerCategory.last)
  end

  test "should show partner_category" do
    get partner_category_url(@partner_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_partner_category_url(@partner_category)
    assert_response :success
  end

  test "should update partner_category" do
    patch partner_category_url(@partner_category), params: { partner_category: {  } }
    assert_redirected_to partner_category_url(@partner_category)
  end

  test "should destroy partner_category" do
    assert_difference('PartnerCategory.count', -1) do
      delete partner_category_url(@partner_category)
    end

    assert_redirected_to p_o_categories_url
  end
end
