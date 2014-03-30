class VisitsController < ApplicationController





  def index


  end


  def new
  	@visit = Visit.new
  	patient_id = user_session[:current_patient_id]
  	if !patient_id
  		patient_id = params[:patient_id]
  	end
  	user_session[:current_patient_id] = patient_id
  	@visit.patient_id = patient_id
  	@visit.save!
  	@patient = Patient.find(patient_id)
  	user_session[:current_visit_id] = @visit.id

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @department }
    # end

  end






end
