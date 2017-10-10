require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_url
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post resources_url, params: { resource: { category: @resource.category, file: @resource.file, file_name: @resource.file_name } }
    end

    assert_redirected_to resource_url(Resource.last)
  end

  test "should show resource" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { resource: { category: @resource.category, file: @resource.file, file_name: @resource.file_name } }
    assert_redirected_to resource_url(@resource)
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end
