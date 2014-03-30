class HistoriesController < ApplicationController


  def new
	visit_id = user_session[:current_visit_id]
	@visit = Visit.find(visit_id)

	#get all default history questions
	@categories = Category.where(:master_category => Visit::HISTORY)
	categories_array = @categories.collect { |x| x.id}
	categories_csv = categories_array.join(' , ')
	@questions = Question.where("category_id in (#{categories_csv})")
  	
  end


end
