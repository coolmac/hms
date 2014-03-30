class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_and_set_user
  after_filter :post_test

  def authenticate_and_set_user
  	authenticate_user!
  	if user_signed_in?
  		@user = current_user
  	end
  end

  def post_test
  	# binding.pry
  end

end
