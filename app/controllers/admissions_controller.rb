class AdmissionsController < DetailsController

  # only allowed Url as of now
  def index
    visit_id = user_session[:current_visit_id]
    @admission = Admission.find_by_visit_id(visit_id)
    if !@admission
      @admission = Admission.new(:visit_id => visit_id)
      respond_to do |format|
        format.html { render 'admissions/new'}
      end    
    end
    #   respond_to do |format|
    #     format.html { render 'admissions/edit'}
    #   end
    # else
    #   @admission = Admission.new(:visit_id => visit_id)
    #   respond_to do |format|
    #     format.html { render 'admissions/new'}
    #   end
    # end

  end

  def show
    @admission = Admission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admission }
    end
  end

  def new
    visit_id = user_session[:current_visit_id]
    @admission = Admission.find_by_visit_id(visit_id)
    # binding.pry
    if @admission
      respond_to do |format|
        format.html { render 'admissions/new'}
      end
    else
      @admission = Admission.new(:visit_id => visit_id)
      respond_to do |format|
        format.html # new.html.erb
      end
    end
  end

  def edit
    @admission = Admission.find(params[:id])
  end

  def create
    visit_id = user_session[:current_visit_id]
    params[:admission][:visit_id] = visit_id
    @admission = Admission.new(params[:admission])

    respond_to do |format|
      if @admission.save
        # format.html { redirect_to(@admission, :notice => 'Admission was successfully created.') }
        format.html { redirect_to new_admission_admit_day_path(@admission)}
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @admission = Admission.find(params[:id])

    respond_to do |format|
      if @admission.update_attributes(params[:admission])
        format.html { render 'details/show'}
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @admission = Admission.find(params[:id])
    @admission.destroy

    respond_to do |format|
      format.html { redirect_to admissions_url(visit) }
      format.json { head :ok }
    end
  end
end
