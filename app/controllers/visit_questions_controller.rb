class VisitQuestionsController < ApplicationController
  before_filter :set_patient, :set_visit

  def update
    # if params[:id]=='new'
      @visit_question = VisitQuestion.find_by_visit_id_and_question_id(@current_visit.id,params[:qn_id])
      if @visit_question.blank?
        @visit_question = VisitQuestion.new
      end
      if params[:visit_question][:answer_id] != ""
        @visit_question.visit_id = @current_visit.id
        @visit_question.question_id = params[:qn_id]
        @visit_question.answer_id = params[:visit_question][:answer_id]
        respond_to do |format|
          if @visit_question.save
            # format.html {redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")}
            format.json { respond_with_bip(@visit_question) }
          end
        end
      else
        @visit_question.destroy
        @visit_question = VisitQuestion.new
        respond_to do |format|
          format.json { respond_with_bip(@visit_question) }
        end
      end
    # else 
    #   @visit_question = VisitQuestion.find(params[:id])
    #   respond_to do |format|
    #     if @visit_question.update_attributes(params[:visit_question])
    #       format.html {redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")}
    #       format.json { respond_with_bip(@visit_question) }
    #     end
    #   end
    # end
  end

end
