class VisitsController < ApplicationController
  before_filter: :set_patient

  def select_views_in_layout
    @show_patient_info = true
    @show_visit_info = true
    @show_header = true
  end


  def show_all_investigations
    respond_to do |format|
      format.html { render 'visits/show'} 
    end    
  end

  def show_all_examinations
    respond_to do |format|
      format.html { render 'visits/show'} 
    end
  end

  def show_all_histories
    respond_to do |format|
      format.html { render 'visits/show'} 
    end
  end

  def show_history
    @questions = Question.where(:super_category => 'history')
    @descriptive_questions = DescriptiveQuestion.where(:super_category => 'history', :category => 'history')

  end

  def show_links
    category = params[:category]
    sub_category = params[:sub_category]
    super_category = params[:super_category]
    @categories = []
    Question.where(:super_category => super_category).each do |q|
      @categories << q.category
    end


    respond_to do |format|
      format.html { render 'visits/show'} 
    end
  end


  def index
    patient_id = user_session[:current_patient_id]
    if !patient_id
      patient_id = params[:patient_id]
    end
    user_session[:current_patient_id] = patient_id
    @visits = Visit.where(:patient_id => patient_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  def show
    # @visit = Visit.find(params[:visit_id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end

  def new
    patient_id = user_session[:current_patient_id]
    if !patient_id
      patient_id = params[:patient_id]
    end
    user_session[:current_patient_id] = patient_id
    @visit = Visit.create({:patient_id => patient_id})
    user_session[:current_visit] = @visit
    user_session[:current_visit_id] = @visit.id

    respond_to do |format|
      format.html { render 'show'}
      format.json { render json: @visit }
    end
  end

  def edit
    @visit = Visit.find(params[:id])
  end




  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        user_session[:current_visit_id] = @visit.id
        user_session[:current_visit] = @visit
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.html { render action: "new" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @visit = Visit.find(params[:id])
    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_updated_details
    visit_id = user_session[:current_visit_id]
    # remove nil values in case those get fetched
    # existing_answered_question_ids = VisitQuestion.where(:visit_id => visit_id).collect{|vq| vq.question_id}.delete(nil)
    # existing_descriptive_question_ids = VisitDescriptiveQuestion.where(:visit_id => visit_id).collect{|vdq| vdq.descriptive_question_id}.delete(nil)
    existing_answered_question_ids = VisitQuestion.where(:visit_id => visit_id).collect{|vq| vq.question_id}
    existing_descriptive_question_ids = VisitDescriptiveQuestion.where(:visit_id => visit_id).collect{|vdq| vdq.descriptive_question_id}
    params.each do |key, value|
      if key.start_with?APP_CONFIG["question_prefix"]
        question_id = key.split(APP_CONFIG["question_prefix"])[1].to_i
        if (value != "")
          # VisitQuestion.create_or_update({question_id: question_id, visit_id: visit_id, answer_id: value.to_i})
          if existing_answered_question_ids.include?question_id
            #TODO this MySQL call can be removed, we have already fetch the result
            visit_question = VisitQuestion.find_by_question_id_and_visit_id(question_id, visit_id)
            visit_question.answer_id = value.to_i
            visit_question.save
            existing_answered_question_ids.delete(question_id)
          else
            VisitQuestion.create({question_id: question_id, visit_id: visit_id, answer_id: value.to_i})
          end
        end
      elsif key.start_with?APP_CONFIG["descriptive_question_prefix"]
        descriptive_question_id = key.split(APP_CONFIG["descriptive_question_prefix"])[1].to_i
        if (value != "")
          # VisitQuestion.create_or_update({question_id: question_id, visit_id: visit_id, answer_id: value.to_i})
          if existing_descriptive_question_ids.include?descriptive_question_id
            visit_descriptive_question = VisitDescriptiveQuestion.find_by_descriptive_question_id_and_visit_id(descriptive_question_id, visit_id)
            visit_descriptive_question.answer = value
            visit_descriptive_question.save
            existing_descriptive_question_ids.delete(descriptive_question_id)
          else
            VisitDescriptiveQuestion.create({descriptive_question_id: descriptive_question_id, visit_id: visit_id, answer: value})
          end
        end
      end
    end # end of params check

    if (existing_answered_question_ids.size > 0)
      # remove entries which were answered earlier but deselected on edit
      VisitQuestion.where("visit_id = #{visit_id} and question_id in (#{existing_answered_question_ids.join(', ')})").delete_all
    end

    if (existing_descriptive_question_ids.size > 0)
      # remove entries which were answered earlier but deselected on edit
      VisitDescriptiveQuestion.where("visit_id = #{visit_id} and descriptive_question_id in (#{existing_descriptive_question_ids.join(', ')})").delete_all
    end

  end

  def show_updated_investigations
    visit_id = user_session[:current_visit_id]
    # remove nil values in case those get fetched
    existing_investigations = VisitInvestigation.where(:visit_id => visit_id).collect{|v| v.investigation_id}

    params.each do |key, value|
      if key.start_with?APP_CONFIG["investigation_prefix"]
        investigation_id = key.split(APP_CONFIG["investigation_prefix"])[1].to_i
        if (value != "")
          if existing_investigations.include?investigation_id
            #TODO this MySQL call can be removed, we have already fetch the result
            visit_investigation = VisitInvestigation.find_by_investigation_id_and_visit_id(investigation_id, visit_id)
            visit_investigation.report = value
            visit_investigation.save
            existing_investigations.delete(investigation_id)
          else
            VisitInvestigation.create({investigation_id: investigation_id, visit_id: visit_id, report: value})
          end
        end
      end
    end # end of params check

    if (existing_investigations.size > 0)
      # remove entries which were answered earlier but deselected on edit
      VisitInvestigation.where("visit_id = #{visit_id} and investigation_id in (#{existing_investigations.join(', ')})").delete_all
    end

  end

  def update_details
    @super_category = params[:super_category]
    @category = params[:category]
    visit_id = user_session[:current_visit_id]
    @answers = Answer.all
    @answers_hash = {}

    @questions = Question.where(:category => @category, :super_category => @super_category)
    if @questions.size > 0
      csv_question_ids = @questions.collect{|q| q.id}.join(', ')
      @visit_questions = VisitQuestion.where("question_id in (#{csv_question_ids}) and visit_id = #{visit_id}")
      if @visit_questions.size > 0
        @visit_questions.each do |vq|
          @answers_hash["#{APP_CONFIG['question_prefix']}#{vq.question_id}"] = vq.answer_id
        end
      end
    end

    @descriptive_questions = DescriptiveQuestion.where(:category => @category, :super_category => @super_category)
    if @descriptive_questions.size > 0
      csv_descriptive_question_ids = @descriptive_questions.collect{|dq| dq.id}.join(', ')
      @visit_descriptive_questions = VisitDescriptiveQuestion.where("descriptive_question_id in (#{csv_descriptive_question_ids}) and visit_id = #{visit_id}")
      if @visit_descriptive_questions.size > 0
        @visit_descriptive_questions.each do |vdq|
          @answers_hash["#{APP_CONFIG['descriptive_question_prefix']}#{vdq.descriptive_question_id}"] = vdq.answer
        end
      end
    end

  end


  def update_investigations
    @sub_category = params[:sub_category]
    @category = params[:category]
    visit_id = user_session[:current_visit_id]
    @reports_hash = {}
    @investigations = Investigation.where(:category => @category, :sub_category => @sub_category)
    if @investigations.size > 0
      csv_investigation_ids = @investigations.collect{|q| q.id}.join(', ')
      @visit_investigations = VisitInvestigation.where("investigation_id in (#{csv_investigation_ids}) and visit_id = #{visit_id}")
      if @visit_investigations.size > 0
        @visit_investigations.each do |vi|
          @reports_hash["#{APP_CONFIG['investigation_prefix']}#{vi.investigation_id}"] = vi.report
        end
      end
    end
  end


  #TODO remove any destroy option from UI
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to visits_url }
      format.json { head :no_content }
    end
  end
end
