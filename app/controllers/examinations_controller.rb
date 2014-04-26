class ExaminationsController < DetailsController

  # previous category is vitals
  def main
  	vitals_description = params[:vitals]
  	if vitals_description
  	  if @current_visit.vitals != vitals_description
  	  	@current_visit.vitals = vitals_description
  	  	@current_visit.save
  	  end
  	end

	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'examinations/vitals'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_examinations' }
      end
	elsif params[:next] != nil
	  respond_to do |format|
        format.html { render 'details/show_examinations' }
      end
	else
	  edit_details()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here  	
  end


  def gpe
  	edit_details()

  end


  def vitals
  	gpe_description = params[:gpe]
  	if gpe_description
  	  if @current_visit.gpe != gpe_description
  	  	@current_visit.gpe = gpe_description
  	  	@current_visit.save
  	  end
  	end
	
	update_details()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  params[:super_category] = params[:previous_super_category]
	  edit_details()
	  respond_to do |format|
        format.html { render 'examinations/gpe'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_examinations' }
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


end
