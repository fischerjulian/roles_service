require 'test_helper'

class OrgUnitsControllerTest < ActionController::TestCase
  setup do
    @org_unit = org_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:org_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org_unit" do
    assert_difference('OrgUnit.count') do
      post :create, org_unit: { description: @org_unit.description, parent_unit_id: @org_unit.parent_unit_id, title: @org_unit.title }
    end

    assert_redirected_to org_unit_path(assigns(:org_unit))
  end

  test "should show org_unit" do
    get :show, id: @org_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @org_unit
    assert_response :success
  end

  test "should update org_unit" do
    patch :update, id: @org_unit, org_unit: { description: @org_unit.description, parent_unit_id: @org_unit.parent_unit_id, title: @org_unit.title }
    assert_redirected_to org_unit_path(assigns(:org_unit))
  end

  test "should destroy org_unit" do
    assert_difference('OrgUnit.count', -1) do
      delete :destroy, id: @org_unit
    end

    assert_redirected_to org_units_path
  end
end
