class VisitsController < ApplicationController
  before_filter :set_patient

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
