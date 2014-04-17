class HistoriesController < DetailsController
  # before_filter :set_patient, :set_visit
  # def select_views_in_layout
  #   @show_patient_info = true
  #   @show_visit_info = false
  #   @show_header = true
  #   @show_left_bar = true
  #   @leave_space_for_left_bar = true
  # end

  def main
	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/other_systems_history'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_history' }
      end
	elsif params[:next] != nil
	  respond_to do |format|
        format.html { render 'details/show_history' }
      end
	else
	  edit_details()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here  	
  end


  def chief_complaint
  	edit_details()

  end


  def pms_history
	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/chief_complaint'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_history' }
      end
	elsif params[:next] != nil
	  edit_details()
	  respond_to do |format|
        format.html
      end
	else
	  edit_details()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here
  end

  def fms_history
	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/pms_history' } 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_history' }
      end
	elsif params[:next] != nil
	  edit_details()
	  respond_to do |format|
        format.html
      end
	else
	  edit_details()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here
	
  end



  def ps_history
	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/fms_history'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_history' }
      end
	elsif params[:next] != nil
	  edit_details()
	  respond_to do |format|
        format.html
      end
	else
	  edit_details()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here

  end

  def treatment_history
	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/ps_history'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_history' }
      end
	elsif params[:next] != nil
	  edit_details()
	  respond_to do |format|
        format.html
      end
	else
	  edit_details()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here
	
  end


  def other_systems_history
	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/treatment_history'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_history' }
      end
	elsif params[:next] != nil
	  respond_to do |format|
        format.html { render 'details/show_history'}
      end
	else
	  edit_details()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here
	
  end

end
