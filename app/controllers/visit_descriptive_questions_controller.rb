class VisitDescriptiveQuestionsController < ApplicationController
  before_filter :set_patient, :set_visit

  def update
    if params[:id]=='new'
      @visit_descriptive_question = VisitDescriptiveQuestion.find_by_visit_id_and_descriptive_question_id(@current_visit.id,params[:qn_id])
      if @visit_descriptive_question.blank?
        @visit_descriptive_question = VisitDescriptiveQuestion.new
      end
      @visit_descriptive_question.visit_id = @current_visit.id
      @visit_descriptive_question.descriptive_question_id = params[:qn_id]
      @visit_descriptive_question.answer = params[:visit_descriptive_question][:answer]
      respond_to do |format|
        if @visit_descriptive_question.save
          # format.html {redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")}
          format.json { respond_with_bip(@visit_descriptive_question) }
        end
      end
    else  
      @visit_descriptive_question = VisitDescriptiveQuestion.find(params[:id])
      respond_to do |format|
        if @visit_descriptive_question.update_attributes(params[:visit_descriptive_question])
          # format.html {redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")}
          format.json { respond_with_bip(@visit_descriptive_question) }
        end
      end
    end
  end

end
