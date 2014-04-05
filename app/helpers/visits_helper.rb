module VisitsHelper


  def get_selected_answer_id (question_id)
  	answer_id = @answers_hash[question_id]
  	if @answers_hash[question_id] != nil
  		return answer_id
  	else
  		return ""
  	end
  end


  
end
