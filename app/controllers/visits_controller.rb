class VisitsController < ApplicationController
  before_filter :set_patient

  def select_views_in_layout
    @show_patient_info = true
    @show_visit_info = false
    @show_header = true
    @show_left_bar = true
    @leave_space_for_left_bar = true
  end

  #TODO patients/create_new_visit should come up here
  def create
    @current_visit = Visit.create({:patient_id => user_session[:current_patient_id]})
    user_session[:current_visit_id] = @current_visit.id
    user_session[:current_visit] = @current_visit
    respond_to do |format|
      format.html { render 'details/show'} 
    end
  end


end
