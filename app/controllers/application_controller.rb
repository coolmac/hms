class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_and_set_user, :select_views_in_layout
  # :set_patient, :set_visit, 
  # after_filter :post_test

  def authenticate_and_set_user
  	authenticate_user!
  	if user_signed_in?
  		@user = current_user
  	end
  end

  def select_views_in_layout
    @show_patient_info = true
    @show_visit_info = false
    @show_header = false
    @show_left_bar = false
    @leave_space_for_left_bar = false
  end

  def reset_patient
    user_session[:current_patient_id] = nil
    user_session[:current_visit_id] = nil
  end

  def set_patient
    if user_session
      if user_session[:current_patient_id] == nil
        redirect_to root_path, :flash => {:error => "No Patient has been selected yet!"}
      else
        @current_patient = Patient.find user_session[:current_patient_id]
      end
    end
  end

  def set_visit
    if user_session
      if (user_session[:current_visit_id] == nil)
        if user_session[:current_patient_id]
          if params[:visit_id]
            user_session[:current_visit_id] = params[:visit_id]
            @current_visit = Visit.find params[:visit_id]
          else
            redirect_to patient_path(user_session[:current_patient_id]), :flash => {:error => "No Visit has been selected for this patient yet!"}
          end
        else
          redirect_to root_path, :flash => {:error => "No Patient has been selected yet!"}
        end
      else
        @current_visit = Visit.find user_session[:current_visit_id]
      end
    end    
  end

  def post_test
  	# binding.pry
  end

end
