require 'test_helper'

class PartneringOrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partnering_organization = partnering_organizations(:one)
  end

  test "should get index" do
    get partnering_organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_partnering_organization_url
    assert_response :success
  end

  test "should create partnering_organization" do
    assert_difference('PartneringOrganization.count') do
      post partnering_organizations_url, params: { partnering_organization: { address: @partnering_organization.address, demographic: @partnering_organization.demographic, lat: @partnering_organization.lat, lng: @partnering_organization.lng, name: @partnering_organization.name, phone_number: @partnering_organization.phone_number, role: @partnering_organization.role, website: @partnering_organization.website } }
    end

    assert_redirected_to partnering_organization_url(PartneringOrganization.last)
  end

  test "should show partnering_organization" do
    get partnering_organization_url(@partnering_organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_partnering_organization_url(@partnering_organization)
    assert_response :success
  end

  test "should update partnering_organization" do
    patch partnering_organization_url(@partnering_organization), params: { partnering_organization: { address: @partnering_organization.address, demographic: @partnering_organization.demographic, lat: @partnering_organization.lat, lng: @partnering_organization.lng, name: @partnering_organization.name, phone_number: @partnering_organization.phone_number, role: @partnering_organization.role, website: @partnering_organization.website } }
    assert_redirected_to partnering_organization_url(@partnering_organization)
  end

  test "should destroy partnering_organization" do
    assert_difference('PartneringOrganization.count', -1) do
      delete partnering_organization_url(@partnering_organization)
    end

    assert_redirected_to partnering_organizations_url
  end
end
