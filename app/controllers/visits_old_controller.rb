class VisitsController < ApplicationController

# rails g scaffold fm_history visit_id:integer diabetes:integer hypertension:integer hyperlipidemia:integer tuberculosis:integer stroke:integer asthma:integer surgery:integer free_text:text



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



  def show
    patient_id = user_session[:current_patient_id]
    if !patient_id
      patient_id = params[:id]
    end
    #TODO if session variable is not set for current_patient_id, go back to selecting visits/patients
    user_session[:current_patient_id] = patient_id
    @visits = Visit.where(:patient_id => patient_id)

    @patient = Patient.find(patient_id)
    # @visits = @patient.visits
  end



  def create 
    patient_id = user_session[:current_patient_id]
    if !patient_id
      patient_id = params[:id]
    end
    #TODO if session variable is not set for current_patient_id, go back to selecting visits/patients
    user_session[:current_patient_id] = patient_id
  end




end
