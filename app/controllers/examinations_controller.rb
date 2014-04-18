class ExaminationsController < DetailsController

  def main
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
