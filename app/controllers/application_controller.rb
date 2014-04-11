class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_and_set_user, :set_patient, :set_visit, :select_views_in_layout
  after_filter :post_test

  def authenticate_and_set_user
  	authenticate_user!
  	if user_signed_in?
  		@user = current_user
  	end
  end

  def select_views_in_layout
    @show_patient_info = true
    @show_visit_info = true
  end

  def set_patient
    if user_session
      if user_session[:current_patient] == nil
        # redirect to home page
      else
        @current_patient = user_session[:current_patient]
      end
    end
  end

  def set_visit
    if user_session
      if user_session[:current_visit] == nil
        # redirect to visit selection page if current_patient is available
        # else redirect to patient selection page
      else
        @current_visit = user_session[:current_visit]
      end
    end    
  end

  def post_test
  	# binding.pry
  end

end
