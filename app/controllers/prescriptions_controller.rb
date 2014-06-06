class PrescriptionsController < DetailsController
  # GET visits/1/prescriptions
  # GET visits/1/prescriptions.json
  def index
    @visit = Visit.find(params[:visit_id])
    @prescriptions = @visit.prescriptions
    @prescription = @visit.prescriptions.build
    @favourite_prescriptions = FavouritePrescription.where(:user_id=>current_user).map{ |fp| [fp.name, fp.id] }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @prescriptions }
    end
  end

  # GET visits/1/prescriptions/1
  # GET visits/1/prescriptions/1.json
  def show
    @visit = Visit.find(params[:visit_id])
    @prescription = @visit.prescriptions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @prescription }
    end
  end

  # GET visits/1/prescriptions/new
  # GET visits/1/prescriptions/new.json
  def new
    @visit = Visit.find(params[:visit_id])
    @favourite_prescriptions = FavouritePrescription.where(:user_id=>current_user).map{ |fp| [fp.name, fp.id] }
    @prescription = @visit.prescriptions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @prescription }
    end
  end

  # GET visits/1/prescriptions/1/edit
  def edit
    @visit = Visit.find(params[:visit_id])
    @prescription = @visit.prescriptions.find(params[:id])
  end

  # POST visits/1/prescriptions
  # POST visits/1/prescriptions.json
  def create
    @visit = Visit.find(params[:visit_id])
    if !params[:favourite_prescription].blank?
      @favourite_prescription = FavouritePrescription.find(params[:favourite_prescription])
      @favourite_prescription.prescription_medicines.each do |medicine|
        @prescription = @visit.prescriptions.new
        @prescription.medicine = medicine.medicine
        @prescription.frequency = medicine.frequency
        @prescription.duration = medicine.duration
        @prescription.route = medicine.route
        @prescription.save
      end
      respond_to do |format|
          format.html { redirect_to visit_prescriptions_url }
      end
    else
      @prescription = @visit.prescriptions.build(params[:prescription])

      respond_to do |format|
        if @prescription.save
          format.html { redirect_to visit_prescriptions_url }
          format.json { render :json => @prescription, :status => :created, :location => [@prescription.visit, @prescription] }
        else
          format.html { render :action => "new" }
          format.json { render :json => @prescription.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT visits/1/prescriptions/1
  # PUT visits/1/prescriptions/1.json
  def update
    @visit = Visit.find(params[:visit_id])
    @prescription = @visit.prescriptions.find(params[:id])

    respond_to do |format|
      if @prescription.update_attributes(params[:prescription])
        format.html { redirect_to visit_prescriptions_url }
        format.json { respond_with_bip(@prescription) }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @prescription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE visits/1/prescriptions/1
  # DELETE visits/1/prescriptions/1.json
  def destroy
    @visit = Visit.find(params[:visit_id])
    @prescription = @visit.prescriptions.find(params[:id])
    @prescription.destroy

    respond_to do |format|
      format.html { redirect_to visit_prescriptions_url() }
      format.json { head :ok }
    end
  end
end
