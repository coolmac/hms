class PrescriptionMedicinesController < ApplicationController
 
  def select_views_in_layout
    @show_patient_info = false
    @show_visit_info = false
    @show_header = true
    @show_left_bar = true
    @leave_space_for_left_bar = true
  end
  
  def show
  end

  def edit
  	@favourite_prescription = FavouritePrescription.find(params[:favourite_prescription_id])
    @prescription_medicine = @favourite_prescription.prescription_medicines.find(params[:id])
  end

  def new
  	@favourite_prescription = FavouritePrescription.find(params[:favourite_prescription_id])
    @prescription_medicine = @favourite_prescription.prescription_medicines.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @prescription_medicine }
    end
  end

  def create
  	@favourite_prescription = FavouritePrescription.find(params[:favourite_prescription_id])
    params[:prescription_medicine][:favourite_prescription_id] = @favourite_prescription.id
    @prescription_medicine = PrescriptionMedicine.new(params[:prescription_medicine])

    respond_to do |format|
      if @prescription_medicine.save
        format.html { redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine created successfully") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    if params[:favourite_prescription_id]
  	   @favourite_prescription = FavouritePrescription.find(params[:favourite_prescription_id])
       @prescription_medicine = @favourite_prescription.prescription_medicines.find(params[:id])
    else
      @prescription_medicine = PrescriptionMedicine.find(params[:id])
    end

    respond_to do |format|
      if @prescription_medicine.update_attributes(params[:prescription_medicine])
        format.html {
          if request.xhr?
            # *** repond with the new value ***
            render :text => params[:prescription_medicine].values.first
          else
            redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")
          end
        }
        #format.html { redirect_to([@admit_day.admission, @admit_day], :notice => 'Admit day was successfully updated.') }
        # format.html { redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine updated successfully")}
        # format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @admit_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  	@favourite_prescription = FavouritePrescription.find(params[:favourite_prescription_id])
    @prescription_medicine = @favourite_prescription.prescription_medicines.find(params[:id])
    @prescription_medicine.destroy

    respond_to do |format|
      format.html { redirect_to(edit_favourite_prescription_path(@favourite_prescription), :notice => "Medicine deleted successfully") }
      format.json { head :ok }
    end
  end

end
