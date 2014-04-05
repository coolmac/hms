class Question < ActiveRecord::Base
  attr_accessible :title, :sub_category, :category, :super_category, :answer_type

  #TODO create a common function for any model, not specific to Question Model
  def self.create_or_update (params)
  	params.each do |param|
  		question_model = Question.where(param)
  		if question_model.size > 0
  			puts "Entry #{param} - already exists"
  			question_model[0].update_attributes(param)
  		else
  			Question.create(param)
  		end
  	end
  end

end
