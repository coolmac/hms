require 'test_helper'

class AdmitDaysControllerTest < ActionController::TestCase
  setup do
    @admission = admissions(:one)
    @admit_day = admit_days(:one)
  end

  test "should get index" do
    get :index, :admission_id => @admission
    assert_response :success
    assert_not_nil assigns(:admit_days)
  end

  test "should get new" do
    get :new, :admission_id => @admission
    assert_response :success
  end

  test "should create admit_day" do
    assert_difference('AdmitDay.count') do
      post :create, :admission_id => @admission, :admit_day => @admit_day.attributes
    end

    assert_redirected_to admission_admit_day_path(@admission, assigns(:admit_day))
  end

  test "should show admit_day" do
    get :show, :admission_id => @admission, :id => @admit_day.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :admission_id => @admission, :id => @admit_day.to_param
    assert_response :success
  end

  test "should update admit_day" do
    put :update, :admission_id => @admission, :id => @admit_day.to_param, :admit_day => @admit_day.attributes
    assert_redirected_to admission_admit_day_path(@admission, assigns(:admit_day))
  end

  test "should destroy admit_day" do
    assert_difference('AdmitDay.count', -1) do
      delete :destroy, :admission_id => @admission, :id => @admit_day.to_param
    end

    assert_redirected_to admission_admit_days_path(@admission)
  end
end
