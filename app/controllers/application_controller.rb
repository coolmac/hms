class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_and_set_user

  def authenticate_and_set_user
  	authenticate_user!
  	if user_signed_in?
  		@user = current_user
  	end
  end

end
