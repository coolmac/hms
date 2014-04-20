require 'test_helper'

class PrescriptionsControllerTest < ActionController::TestCase
  setup do
    @visit = visits(:one)
    @prescription = prescriptions(:one)
  end

  test "should get index" do
    get :index, :visit_id => @visit
    assert_response :success
    assert_not_nil assigns(:prescriptions)
  end

  test "should get new" do
    get :new, :visit_id => @visit
    assert_response :success
  end

  test "should create prescription" do
    assert_difference('Prescription.count') do
      post :create, :visit_id => @visit, :prescription => @prescription.attributes
    end

    assert_redirected_to visit_prescription_path(@visit, assigns(:prescription))
  end

  test "should show prescription" do
    get :show, :visit_id => @visit, :id => @prescription.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :visit_id => @visit, :id => @prescription.to_param
    assert_response :success
  end

  test "should update prescription" do
    put :update, :visit_id => @visit, :id => @prescription.to_param, :prescription => @prescription.attributes
    assert_redirected_to visit_prescription_path(@visit, assigns(:prescription))
  end

  test "should destroy prescription" do
    assert_difference('Prescription.count', -1) do
      delete :destroy, :visit_id => @visit, :id => @prescription.to_param
    end

    assert_redirected_to visit_prescriptions_path(@visit)
  end
end
