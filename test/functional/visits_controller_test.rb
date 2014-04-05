require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  setup do
    @visit = visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visit" do
    assert_difference('Visit.count') do
      post :create, visit: { chief_complaint: @visit.chief_complaint, description: @visit.description, fm_history: @visit.fm_history, other_systems: @visit.other_systems, patient_id: @visit.patient_id, pms_history: @visit.pms_history, ps_history: @visit.ps_history, treatment_history: @visit.treatment_history }
    end

    assert_redirected_to visit_path(assigns(:visit))
  end

  test "should show visit" do
    get :show, id: @visit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visit
    assert_response :success
  end

  test "should update visit" do
    put :update, id: @visit, visit: { chief_complaint: @visit.chief_complaint, description: @visit.description, fm_history: @visit.fm_history, other_systems: @visit.other_systems, patient_id: @visit.patient_id, pms_history: @visit.pms_history, ps_history: @visit.ps_history, treatment_history: @visit.treatment_history }
    assert_redirected_to visit_path(assigns(:visit))
  end

  test "should destroy visit" do
    assert_difference('Visit.count', -1) do
      delete :destroy, id: @visit
    end

    assert_redirected_to visits_path
  end
end
