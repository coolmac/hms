class PatientsController < ApplicationController

  def select_views_in_layout
    @show_patient_info = true
    @show_visit_info = false
    @show_header = true
    @show_left_bar = true
    @leave_space_for_left_bar = true
  end

  def index
    @patients = @user.patients

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  def show
    @patient = Patient.find(params[:id])
    user_session[:current_patient_id] = @patient.id
    user_session[:current_visit_id] = nil
    @visits = @patient.visits.sort! { |a,b| b.created_at <=> a.created_at}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  def new
    @patient = Patient.new
    @patient.address = Address.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  def edit
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end


  def create
    @current_patient = Patient.new(params[:patient])
    respond_to do |format|
      if @current_patient.save
        user_session[:current_patient_id] = @current_patient.id
        @user.patients << @current_patient
        @current_visit = Visit.create({:patient_id => @current_patient.id, :visit_time =>(Time.now).strftime("%Y-%m-%d")})
        user_session[:current_visit_id] = @current_visit.id
        format.html { render 'details/show', notice: 'Patient was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      #binding.pry
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @patient = Patient.new
  end

  def generic_search
    table_column = params["radio-inline"]
    table_column_sym = params["radio-inline"].to_sym
    search_input = params["search_input"]
    @exact_result_found = false
    @exact_results = Patient.where(table_column_sym => search_input)

    if @exact_results.size > 0
      @exact_result_found = true
    else
      @comments = "NO Fuzzy Matches based on your input."
      @fuzzy_results = []
      if table_column == "first_name"
        @fuzzy_results = Patient.find_by_fuzzy_first_name(search_input)
      elsif table_column == "last_name"
        @fuzzy_results = Patient.find_by_fuzzy_last_name(search_input)
      elsif table_column == "mobile"
        @fuzzy_results = Patient.find_by_fuzzy_mobile(search_input)
      elsif table_column == "email"
        @fuzzy_results = Patient.find_by_fuzzy_email(search_input)
      else
        @fuzzy_results = Patient.find_by_fuzzy_uhid(search_input)
      end
      if @fuzzy_results.size > 0
        @comments = "Fuzzy Matches found based on your input: "
      end
    end

  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

end
