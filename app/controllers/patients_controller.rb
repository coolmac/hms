class PatientsController < ApplicationController

  def index
    @patients = @user.patients

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new
    @patient.address = Address.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])
    respond_to do |format|
      if @patient.save
        @user.patients << @patient
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
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
      @comments = "Similar Results based on your input: "
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
        @comments = "No fuzzy search for this search type - #{table_column}"
      end

    end

  end

  # def search_by_uhid
  #   uhid = params[:id]
  #   @patient = Patient.find(uhid)

  #   if (!@patient)
  #     @exact_result_found = false
  #     @notice = "No Results found for UHID: #{uhid}"
  #   else
  #     @exact_result_found = true
  #   end
  # end

  # def search_by_first_name
  #   name = params[:patient][:first_name]
  #   @patient = Patient.where(:first_name => name)
  #   render "search_results"
  #   if (@patient.size > 0)
  #     @exact_result_found = true
  #     #user_session[:patient_id] = @patient.id
  #   else
  #     #Provide fuzzy results
  #     %# @exact_result_found = false
  #     if (!name.nil?)
  #       @fuzzy_results_by_name = Patient.find_by_fuzzy_name(name)
  #     end
  #     if (!mobile.nil?)
  #       @fuzzy_results_by_mobile = Patient.find_by_fuzzy_mobile(mobile)
  #     end
  #     %#
  #   end
  # end

  # def search_by_mobile
  #   mobile = params[:patient][:mobile]
  #   @patient = Patient.where(:mobile => mobile)
  #   render "search_results"
  #   if (@patient.size > 0)
  #     @exact_result_found = true
  #     user_session[:patient_id] = @patient.id
  #   else
  #     #Provide fuzzy results
  #     %# @exact_result_found = false
  #     if (!name.nil?)
  #       @fuzzy_results_by_name = Patient.find_by_fuzzy_name(name)
  #     end
  #     if (!mobile.nil?)
  #       @fuzzy_results_by_mobile = Patient.find_by_fuzzy_mobile(mobile)
  #     end
  #     %#
  #   end
  # end

  def search_by_email
    email = params[:patient][:email]
    @patient = Patient.where(:email => email)
    render "search_results"
    if (@patient.size > 0)
      @exact_result_found = true
      user_session[:patient_id] = @patient.id
    else
      #Provide fuzzy results
      %# @exact_result_found = false
      if (!name.nil?)
        @fuzzy_results_by_name = Patient.find_by_fuzzy_name(name)
      end
      if (!mobile.nil?)
        @fuzzy_results_by_mobile = Patient.find_by_fuzzy_mobile(mobile)
      end
      %#
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
