require 'test_helper'

class AdmissionsControllerTest < ActionController::TestCase
  setup do
    @visit = visits(:one)
    @admission = admissions(:one)
  end

  test "should get index" do
    get :index, :visit_id => @visit
    assert_response :success
    assert_not_nil assigns(:admissions)
  end

  test "should get new" do
    get :new, :visit_id => @visit
    assert_response :success
  end

  test "should create admission" do
    assert_difference('Admission.count') do
      post :create, :visit_id => @visit, :admission => @admission.attributes
    end

    assert_redirected_to visit_admission_path(@visit, assigns(:admission))
  end

  test "should show admission" do
    get :show, :visit_id => @visit, :id => @admission.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :visit_id => @visit, :id => @admission.to_param
    assert_response :success
  end

  test "should update admission" do
    put :update, :visit_id => @visit, :id => @admission.to_param, :admission => @admission.attributes
    assert_redirected_to visit_admission_path(@visit, assigns(:admission))
  end

  test "should destroy admission" do
    assert_difference('Admission.count', -1) do
      delete :destroy, :visit_id => @visit, :id => @admission.to_param
    end

    assert_redirected_to visit_admissions_path(@visit)
  end
end
