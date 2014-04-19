class AdmitDaysController < ApplicationController
  # GET admissions/1/admit_days
  # GET admissions/1/admit_days.json
  def index
    @admission = Admission.find(params[:admission_id])
    @admit_days = @admission.admit_days

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @admit_days }
    end
  end

  # GET admissions/1/admit_days/1
  # GET admissions/1/admit_days/1.json
  def show
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admit_day }
    end
  end

  # GET admissions/1/admit_days/new
  # GET admissions/1/admit_days/new.json
  def new
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @admit_day }
    end
  end

  # GET admissions/1/admit_days/1/edit
  def edit
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.find(params[:id])
  end

  # POST admissions/1/admit_days
  # POST admissions/1/admit_days.json
  def create
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.build(params[:admit_day])

    respond_to do |format|
      if @admit_day.save
        format.html { redirect_to([@admit_day.admission, @admit_day], :notice => 'Admit day was successfully created.') }
        format.json { render :json => @admit_day, :status => :created, :location => [@admit_day.admission, @admit_day] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @admit_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admissions/1/admit_days/1
  # PUT admissions/1/admit_days/1.json
  def update
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.find(params[:id])

    respond_to do |format|
      if @admit_day.update_attributes(params[:admit_day])
        format.html { redirect_to([@admit_day.admission, @admit_day], :notice => 'Admit day was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @admit_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admissions/1/admit_days/1
  # DELETE admissions/1/admit_days/1.json
  def destroy
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.find(params[:id])
    @admit_day.destroy

    respond_to do |format|
      format.html { redirect_to admission_admit_days_url(admission) }
      format.json { head :ok }
    end
  end
end
