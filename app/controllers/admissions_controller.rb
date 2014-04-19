class AdmissionsController < ApplicationController

  # GET visits/1/admissions
  # GET visits/1/admissions.json
  def index
    @visit = Visit.find(params[:visit_id])
    @admissions = @visit.admissions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @admissions }
    end
  end

  # GET visits/1/admissions/1
  # GET visits/1/admissions/1.json
  def show
    @visit = Visit.find(params[:visit_id])
    @admission = @visit.admissions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admission }
    end
  end

  # GET visits/1/admissions/new
  # GET visits/1/admissions/new.json
  def new
    @visit = Visit.find(params[:visit_id])
    @admission = @visit.admissions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @admission }
    end
  end

  # GET visits/1/admissions/1/edit
  def edit
    @visit = Visit.find(params[:visit_id])
    @admission = @visit.admissions.find(params[:id])
  end

  # POST visits/1/admissions
  # POST visits/1/admissions.json
  def create
    @visit = Visit.find(params[:visit_id])
    @admission = @visit.admissions.build(params[:admission])

    respond_to do |format|
      if @admission.save
        format.html { redirect_to([@admission.visit, @admission], :notice => 'Admission was successfully created.') }
        format.json { render :json => @admission, :status => :created, :location => [@admission.visit, @admission] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @admission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT visits/1/admissions/1
  # PUT visits/1/admissions/1.json
  def update
    @visit = Visit.find(params[:visit_id])
    @admission = @visit.admissions.find(params[:id])

    respond_to do |format|
      if @admission.update_attributes(params[:admission])
        format.html { redirect_to([@admission.visit, @admission], :notice => 'Admission was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @admission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE visits/1/admissions/1
  # DELETE visits/1/admissions/1.json
  def destroy
    @visit = Visit.find(params[:visit_id])
    @admission = @visit.admissions.find(params[:id])
    @admission.destroy

    respond_to do |format|
      format.html { redirect_to visit_admissions_url(visit) }
      format.json { head :ok }
    end
  end
end
