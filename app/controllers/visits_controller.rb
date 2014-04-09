class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
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

  # GET /visits/1
  # GET /visits/1.json
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.json
  def new
    @visit = Visit.new
    patient_id = user_session[:current_patient_id]
    if !patient_id
      patient_id = params[:patient_id]
    end
    user_session[:current_patient_id] = patient_id
    @visit.patient_id = patient_id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visit }
    end
  end

  # GET /visits/1/edit
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
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.html { render action: "new" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.json
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
    # this is for static answers
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
