class AdmitDaysController < DetailsController

  def index
    @admission = Admission.find(params[:admission_id])
    @admit_days = @admission.admit_days

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @admit_days }
    end
  end

  def show
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admit_day }
    end
  end

  def new
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @admit_day }
    end
  end

  def edit
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.find(params[:id])
  end

  def create
    @admission = Admission.find(params[:admission_id])
    params[:admit_day][:admission_id] = @admission.id
    @admit_day = AdmitDay.new(params[:admit_day])

    respond_to do |format|
      if @admit_day.save
        format.html { redirect_to( edit_admission_path(@admission)) }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @admission = Admission.find(params[:admission_id])
    @admit_day = @admission.admit_days.find(params[:id])

    respond_to do |format|
      if @admit_day.update_attributes(params[:admit_day])
        #format.html { redirect_to([@admit_day.admission, @admit_day], :notice => 'Admit day was successfully updated.') }
        format.html { redirect_to '/admissions'}
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
      format.html { redirect_to admission_admit_days_path() }
      format.json { head :ok }
    end
  end
end
