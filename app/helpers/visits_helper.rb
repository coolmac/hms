module VisitsHelper


  def get_selected_answer_id (question_id)
  	answer_id = @question_answer_ids_hash[question_id]
  	if @question_answer_ids_hash[question_id] != nil
  		return answer_id
  	else
  		return ""
  	end
  end


  
end
