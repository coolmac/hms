class HistoriesController < DetailsController
## #TODO Finally, this should be merged in one function

  # previous_category is other_systems
  def main
  	new_os_history_description = params[:other_systems]
  	if new_os_history_description
  	  if @current_visit.other_systems != new_os_history_description
  	  	@current_visit.other_systems = new_os_history_description
  	  	@current_visit.save
  	  end
  	end

	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/other_systems_history'} 
      end
	elsif params[:exit] != nil
    render_history_main_page()
	elsif params[:next] != nil
    render_history_main_page()
	else
    render_history_main_page()
	end
	# Please don't render here  	
  end

  def chief_complaint
  	edit_details()

  end


  # previous_category is chief_complaint
  def pms_history
  	new_chief_complaint_description = params[:chief_complaint]
  	if new_chief_complaint_description
  	  if @current_visit.chief_complaint != new_chief_complaint_description
  	  	@current_visit.chief_complaint = new_chief_complaint_description
  	  	@current_visit.save
  	  end
  	end

	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/chief_complaint'} 
      end
	elsif params[:exit] != nil
    render_history_main_page()
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


  # previous_category is pms_history
  def fms_history
  	new_pms_history_description = params[:pms_history]
  	if new_pms_history_description
  	  if @current_visit.pms_history != new_pms_history_description
  	  	@current_visit.pms_history = new_pms_history_description
  	  	@current_visit.save
  	  end
  	end

	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/pms_history' } 
      end
	elsif params[:exit] != nil
    render_history_main_page()
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



  # previous_category is fms_history
  def ps_history
  	new_fms_history_description = params[:fms_history]
  	if new_fms_history_description
  	  if @current_visit.fms_history != new_fms_history_description
  	  	@current_visit.fms_history = new_fms_history_description
  	  	@current_visit.save
  	  end
  	end

	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/fms_history'} 
      end
	elsif params[:exit] != nil
    render_history_main_page()
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

  # previous_category is ps_history
  def treatment_history
  	new_ps_history_description = params[:ps_history]
  	if new_ps_history_description
  	  if @current_visit.ps_history != new_ps_history_description
  	  	@current_visit.ps_history = new_ps_history_description
  	  	@current_visit.save
  	  end
  	end

	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/ps_history'} 
      end
	elsif params[:exit] != nil
    render_history_main_page()
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


  # previous_category is treatment_history
  def other_systems_history
  	new_treatment_history_description = params[:treatment_history]
  	if new_treatment_history_description
  	  if @current_visit.treatment_history != new_treatment_history_description
  	  	@current_visit.treatment_history = new_treatment_history_description
  	  	@current_visit.save
  	  end
  	end

	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'histories/treatment_history'} 
      end
	elsif params[:exit] != nil
    render_history_main_page()
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

end
