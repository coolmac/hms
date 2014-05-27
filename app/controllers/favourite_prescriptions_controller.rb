class FavouritePrescriptionsController < ApplicationController
  
  def select_views_in_layout
    @show_patient_info = false
    @show_visit_info = false
    @show_header = true
    @show_left_bar = true
    @leave_space_for_left_bar = true
  end
  
  def index
  	@user = User.find(current_user)
  	@favourite_prescriptions = @user.favourite_prescriptions
  	@favourite_prescription = FavouritePrescription.new
  end

  def create
  	@user = User.find(current_user)
    @favourite_prescription = @user.favourite_prescriptions.build(params[:favourite_prescription])

    respond_to do |format|
      if @favourite_prescription.save
        #format.html { redirect_to favourite_prescriptions_url }
        format.html { redirect_to edit_favourite_prescription_path(@favourite_prescription)}
        format.json { render :json => @favourite_prescription, :status => :created, :location => [@favourite_prescription] }
      else
        format.html { render :action => "index" }
        format.json { render :json => @favourite_prescription.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  	@user = User.find(current_user)
  	@favourite_prescriptions = @user.favourite_prescriptions
  	@favourite_prescription = @favourite_prescriptions.find(params[:id])
    @prescription_medicine = @favourite_prescription.prescription_medicines.build
  end

  def update
  	@user = User.find(current_user)
  	@favourite_prescription = @user.favourite_prescriptions.find(params[:id])

    respond_to do |format|
      if @favourite_prescription.update_attributes(params[:favourite_prescription])
        format.html {
          if request.xhr?
            # *** repond with the new value ***
            render :text => params[:favourite_prescription].values.first
          else
            redirect_to favourite_prescriptions_url, notice: 'Prescription updated successfully'
          end
          }
          # format.html { redirect_to favourite_prescriptions_url, notice: 'Prescription updated successfully' }
          # format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @favourite_prescription.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  	@user = User.find(current_user)
  	@favourite_prescription = @user.favourite_prescriptions.find(params[:id])
    @favourite_prescription.destroy

    respond_to do |format|
      format.html { redirect_to favourite_prescriptions_url() }
      format.json { head :ok }
    end
  end

end
