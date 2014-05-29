class VisitInvestigationsController < ApplicationController
  before_filter :set_patient, :set_visit

  def update
    if params[:id]=='new'
      @visit_investigation = VisitInvestigation.find_by_visit_id_and_investigation_id(@current_visit.id,params[:qn_id])
      if @visit_investigation.blank?
        @visit_investigation = VisitInvestigation.new
      end
      @visit_investigation.visit_id = @current_visit.id
      @visit_investigation.investigation_id = params[:qn_id]
      @visit_investigation.report = params[:visit_investigation][:report]
      respond_to do |format|
        if @visit_investigation.save
          # format.html {redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")}
          format.json { respond_with_bip(@visit_investigation) }
        end
      end
    else 
      @visit_investigation = VisitInvestigation.find(params[:id])
      respond_to do |format|
        if @visit_investigation.update_attributes(params[:visit_question])
          format.html {redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")}
          format.json { respond_with_bip(@visit_investigation) }
        end
      end
    end
  end

end
