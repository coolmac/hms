class DetailsController < ApplicationController
  before_filter :set_patient, :set_visit

  def select_views_in_layout
    @show_patient_info = true
    @show_visit_info = true
    @show_header = true
    @show_left_bar = true
    @leave_space_for_left_bar = true
  end

  def render_investigations_main_page
    params[:super_category] = 'investigation'
    get_visit_question_details()
    if params[:pdf]
      #TODO pdf to be generated
    else
      respond_to do |format|
        format.html {render 'details/show_investigations'}
      end
    end
  end


  # flow can come from show_history page or Directly
  def show_investigations
    if params[:save] != nil
      update_details()
      render_examinations_main_page()
    elsif params[:next] != nil
      update_details()
      render_investigations_main_page()
    else
      render_investigations_main_page()
    end
    # Don't render anything here
  end

  def render_history_main_page
    params[:super_category] = 'history'
    get_visit_question_details()
    if params[:pdf]
      dir = File.dirname("#{Rails.root}/pdfs/History/#{@current_patient.first_name}/x")
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
      pdf = WickedPdf.new.pdf_from_string(render_to_string('details/_history_pdf.html.erb'))
      save_path = Rails.root.join('pdfs/History/'+@current_patient.first_name,@current_visit.created_at.to_s)
      File.open(save_path, 'wb') do |file|
        file << pdf
      end
      pdf_filename = File.join(Rails.root, "pdfs/History/#{@current_patient.first_name}/#{@current_visit.created_at}")
      send_file(pdf_filename, :filename => "History.pdf", :disposition => 'inline', :type => "application/pdf")
    else
      respond_to do |format|
        format.html {render 'details/show_history'}
      end
    end
  end

  def render_examinations_main_page
    params[:super_category] = 'examination'
    get_visit_question_details()
    if params[:pdf]
      dir = File.dirname("#{Rails.root}/pdfs/Examination/#{@current_patient.first_name}/x")
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
      pdf = WickedPdf.new.pdf_from_string(render_to_string('details/_history_pdf.html.erb'))
      save_path = Rails.root.join('pdfs/Examination/'+@current_patient.first_name,@current_visit.created_at.to_s)
      File.open(save_path, 'wb') do |file|
        file << pdf
      end
      pdf_filename = File.join(Rails.root, "pdfs/Examination/#{@current_patient.first_name}/#{@current_visit.created_at}")
      send_file(pdf_filename, :filename => "Examination.pdf", :disposition => 'inline', :type => "application/pdf")
    else
      respond_to do |format|
        format.html {render 'details/show_examinations'}
      end
    end
  end


  # flow can come from show_history page or Directly
  def show_examinations
    if params[:save] != nil
      update_details()
      render_history_main_page()
    elsif params[:next] != nil
      update_details()
      render_examinations_main_page()
    else
      render_examinations_main_page()
    end
    # Don't render anything here
  end

  def show_history
    render_history_main_page()
  end

  def show
  # @visit = Visit.find(params[:visit_id])
  end

  def get_visit_question_details
    visit_id = @current_visit.id
    @super_category = params[:super_category]
    @categories = Visit.get_categories(@super_category)
    @questions = Question.where(:super_category => @super_category)
    @descriptive_questions = DescriptiveQuestion.where(:super_category => @super_category)
    #@investigations = Investigation.all
    @question_ids = @questions.collect{|hq| hq.id}.join(', ')
    @descriptive_question_ids = @descriptive_questions.collect{|hdq| hdq.id}
    #@investigation_ids = @investigations.collect{|q| q.id}.join(', ')

    #TODO Doesn't seem optimized - Need to check up difference between joins (two tables) and IN (one table) statement
    @sc_visit_questions = VisitQuestion.select("visit_questions.*,questions.title,questions.category").joins(",questions").where(:visit_id => visit_id).where("questions.id=visit_questions.question_id")
    @sc_visit_descriptive_questions = VisitDescriptiveQuestion.select("visit_descriptive_questions.*,descriptive_questions.title,descriptive_questions.category").joins(",descriptive_questions").where(:visit_id => visit_id)
                                      .where("descriptive_questions.id=visit_descriptive_questions.descriptive_question_id")
    # @sc_visit_questions = VisitQuestion.where(:visit_id => visit_id, :question_id => @question_ids)
    # @sc_visit_descriptive_questions = VisitDescriptiveQuestion.where(:visit_id => visit_id, :descriptive_question_id => @descriptive_question_ids)

    #@sc_investigations = VisitInvestigation.where(:visit_id => visit_id, :investigation_id => @investigation_ids)
    
    # @existing_answered_question_ids = @sc_visit_questions.collect{|vq| vq.question_id}
    # @existing_descriptive_question_ids = @sc_visit_descriptive_questions.collect{|vdq| vdq.descriptive_question_id}

    #TODO need to club it with whole single history view 
    #TODO we can try using .includes which will pre-fetch all the descriptive answers
    @answers = Answer.all
    @answers_hash = {}
    if @sc_visit_descriptive_questions.size > 0
      @sc_visit_descriptive_questions.each do |vdq|
        @answers_hash["#{APP_CONFIG['descriptive_question_prefix']}#{vdq.descriptive_question_id}"] = vdq.answer
      end
    end

    @sc_visit_questions.each do |vq|
      @answers_hash["#{APP_CONFIG['question_prefix']}#{vq.question_id}"] = vq.answer_id
    end

  end


  def edit_category
    #TODO what if present category/super_category is unknown
    present_super_category = params[:super_category]
    present_category = params[:category]
    if params[:save] != nil
      update_details()
    elsif params[:exit] != nil
      update_details()
      #TODO need to render parent page for super category
    elsif params[:next] != nil
      update_details()
      @next_category_info = Visit.get_next_category(present_super_category, present_category)
      if @next_category_info != nil
        params[:category] = @next_category_info[0]
      end
    elsif params[:prev] != nil
      update_details()
      @previous_category_info = Visit.get_previous_category(present_super_category, present_category)
      if @previous_category_info != nil
        params[:category] = @previous_category_info[0]
      end
    else
      # it's not a form submission
    end
    
    edit_details()

    #TODO also create format.html for this 
    respond_to do |format|
      format.js { render :layout => false }
    end

  end

  def edit_details
    @super_category = params[:super_category]
    @category = params[:category]
    @full_category = Visit.get_full_name(@super_category,@category)
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

    # common questions and common descriptive questions
    @common_questions = Question.where(:category => "#{@category}#{APP_CONFIG['common_category_tag']}", :super_category => @super_category)
    if @questions.size > 0
      csv_question_ids = @questions.collect{|q| q.id}.join(', ')
      @visit_questions = VisitQuestion.where("question_id in (#{csv_question_ids}) and visit_id = #{visit_id}")
      if @visit_questions.size > 0
        @visit_questions.each do |vq|
          @answers_hash["#{APP_CONFIG['question_prefix']}#{vq.question_id}"] = vq.answer_id
        end
      end
    end

    @common_descriptive_questions = DescriptiveQuestion.where(:category => "#{@category}#{APP_CONFIG['common_category_tag']}", :super_category => @super_category)
    if @descriptive_questions.size > 0
      csv_descriptive_question_ids = @descriptive_questions.collect{|dq| dq.id}.join(', ')
      @visit_descriptive_questions = VisitDescriptiveQuestion.where("descriptive_question_id in (#{csv_descriptive_question_ids}) and visit_id = #{visit_id}")
      if @visit_descriptive_questions.size > 0
        @visit_descriptive_questions.each do |vdq|
          @answers_hash["#{APP_CONFIG['descriptive_question_prefix']}#{vdq.descriptive_question_id}"] = vdq.answer
        end
      end
    end


    #TODO check if investigation needs to be evaluated
    @investigations = Investigation.where(:category => @category)
    if @investigations.size > 0
      csv_investigation_ids = @investigations.collect{|q| q.id}.join(', ')
      @visit_investigations = VisitInvestigation.where("investigation_id in (#{csv_investigation_ids}) and visit_id = #{visit_id}")
      if @visit_investigations.size > 0
        @visit_investigations.each do |vi|
          @answers_hash["#{APP_CONFIG['investigation_prefix']}#{vi.investigation_id}"] = vi.report
        end
      end
    end

  end

  def update_details
    visit_id = user_session[:current_visit_id]
    category = params[:category]
    sub_category = params[:sub_category]
    super_category = params[:super_category]

    # remove nil values in case those get fetched
    # existing_answered_question_ids = VisitQuestion.where(:visit_id => visit_id).collect{|vq| vq.question_id}.delete(nil)
    # existing_descriptive_question_ids = VisitDescriptiveQuestion.where(:visit_id => visit_id).collect{|vdq| vdq.descriptive_question_id}.delete(nil)
    existing_answered_question_ids = VisitQuestion.where(:visit_id => visit_id).collect{|vq| vq.question_id}
    existing_descriptive_question_ids = VisitDescriptiveQuestion.where(:visit_id => visit_id).collect{|vdq| vdq.descriptive_question_id}
    existing_investigations = VisitInvestigation.where(:visit_id => visit_id).collect{|v| v.investigation_id}
    #binding.pry
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
        else
          if existing_answered_question_ids.include?question_id
            visit_question = VisitQuestion.find_by_question_id_and_visit_id(question_id, visit_id).destroy
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
        else
          if existing_descriptive_question_ids.include?descriptive_question_id
            visit_descriptive_question = VisitDescriptiveQuestion.find_by_descriptive_question_id_and_visit_id(descriptive_question_id, visit_id).destroy
          end
        end
      elsif key.start_with?APP_CONFIG["investigation_prefix"]
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
        else
          if existing_investigations.include?investigation_id
            visit_investigation = VisitInvestigation.find_by_investigation_id_and_visit_id(investigation_id, visit_id).destroy
          end
        end
      end
    end # end of params check

    #TODO this is WRONG - we should first find out questions based on category and super_category
    # if (existing_answered_question_ids.size > 0)
    #   # remove entries which were answered earlier but deselected on edit
    #   VisitQuestion.where("visit_id = #{visit_id} and question_id in (#{existing_answered_question_ids.join(', ')})").delete_all
    # end

    # if (existing_descriptive_question_ids.size > 0)
    #   # remove entries which were answered earlier but deselected on edit
    #   VisitDescriptiveQuestion.where("visit_id = #{visit_id} and descriptive_question_id in (#{existing_descriptive_question_ids.join(', ')})").delete_all
    # end

  end

  def edit_investigations
    @sub_category = params[:sub_category]
    @category = params[:category]
    visit_id = user_session[:current_visit_id]
    @reports_hash = {}
    @investigations = Investigation.where(:category => @category)
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

  def update_investigations
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

    #TODO this is WRONG
    # if (existing_investigations.size > 0)
    #   # remove entries which were answered earlier but deselected on edit
    #   VisitInvestigation.where("visit_id = #{visit_id} and investigation_id in (#{existing_investigations.join(', ')})").delete_all
    # end

  end


  def get_history_details
    visit_id = @current_visit.id
    super_category = params[:super_category]
    @questions = Question.where(:super_category => super_category, :category => @category)
    @descriptive_questions = DescriptiveQuestion.where(:super_category => super_category, :category => @category)

    @question_ids = @questions.collect{|hq| hq.id}
    @descriptive_question_ids = @descriptive_questions.collect{|hdq| hdq.id}

    @sc_visit_questions = VisitQuestion.where(:visit_id => visit_id, :question_id => @question_ids)
    @sc_visit_descriptive_questions = VisitDescriptiveQuestion.where(:visit_id => visit_id, :descriptive_question_id => @descriptive_question_ids)
  end

  def get_investigation_details
    visit_id = @current_visit.id
    @investigations = Investigation.where(:category => @category)
    @investigation_ids = @investigations.collect{|inv| inv.id}
    @sc_investigations = VisitInvestigation.where(:investigation_id => @investigation_ids)
  end

  def discharge_summary
    @history = ""
    @investigation = ""
    #binding.pry
    if params[:history_cb]
      params[:super_category] = params[:history_cb]
      @history = params[:history_cb]
      @category = params[:history_sub]
      get_history_details
    end
    if params[:investigation_cb]
      @investigation = params[:investigation_cb]
      @category = params[:investigation_sub]
      get_investigation_details
    end
    if params[:prescription_cb]
      @prescription = params[:prescription_cb]
      @prescriptions = Prescription.where(:visit_id => @current_visit.id)
    end
    if params[:follow_up_cb]
      @follow_up = params[:follow_up_cb]
      @follow_ups = FollowUp.where(:visit_id => @current_visit.id)
    end
    if params[:admission_cb]
      @admission = params[:admission_cb]
      @days = params[:admit_days]
      @admission_details = Admission.where(:visit_id => @current_visit.id)
      @admit_day_details = AdmitDay.where(:id => @days).order("admit_date ASC")
    end
    if params[:submit]
      @pdf = 'true'
      dir = File.dirname("#{Rails.root}/pdfs/Discharge/#{@current_patient.first_name}/x")
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
      pdf = WickedPdf.new.pdf_from_string(render_to_string('details/discharge_summary.html.erb'))
      save_path = Rails.root.join('pdfs/Discharge/'+@current_patient.first_name,@current_visit.created_at.to_s)
      File.open(save_path, 'wb') do |file|
        file << pdf
      end
      pdf_filename = File.join(Rails.root, "pdfs/Discharge/#{@current_patient.first_name}/#{@current_visit.created_at}")
      send_file(pdf_filename, :filename => "History.pdf", :disposition => 'inline', :type => "application/pdf")
    end
  end

  def sub_category
    if params[:super_category]
      @categories = Visit.get_categories(params[:super_category])
      @category_list = @categories.collect{|first,second| first}

      respond_to do |format|
          format.json {render json: @category_list}
      end
    elsif params[:dates]
      @admission_info = Admission.find_by_visit_id(@current_visit.id)
      @days = @admission_info.admit_days
      #binding.pry
      respond_to do |format|
          format.json {render json: @days}
      end
    else
    end
  end

end
