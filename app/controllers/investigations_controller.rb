class InvestigationsController < DetailsController

  def main
	update_investigations()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  edit_investigations()
	  respond_to do |format|
        format.html { render 'investigations/lipid_profile'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_investigations' }
      end
	elsif params[:next] != nil
	  respond_to do |format|
        format.html { render 'details/show_investigations' }
      end
	else
	  edit_investigations()
	  respond_to do |format|
        format.html 
      end
	end
	# Please don't render here
  end


  def hemogram
  	edit_investigations()

  end


  def lft
	update_investigations()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  edit_investigations()
	  respond_to do |format|
        format.html { render 'investigations/hemogram'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_investigations' }
      end
	elsif params[:next] != nil
	  edit_investigations()
	  respond_to do |format|
        format.html 
      end
	else
	  edit_investigations()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here 

  end


  def rft
	update_investigations()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  edit_investigations()
	  respond_to do |format|
        format.html { render 'investigations/lft'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_investigations' }
      end
	elsif params[:next] != nil
	  edit_investigations()
	  respond_to do |format|
        format.html 
      end
	else
	  edit_investigations()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here 
  	
  end


  def glucose
	update_investigations()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  edit_investigations()
	  respond_to do |format|
        format.html { render 'investigations/rft'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_investigations' }
      end
	elsif params[:next] != nil
	  edit_investigations()
	  respond_to do |format|
        format.html 
      end
	else
	  edit_investigations()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here
  end


  def lipid_profile
	update_investigations()

	if params[:save] != nil
	  params[:category] = params[:previous_category]
	  edit_investigations()
	  respond_to do |format|
        format.html { render 'investigations/glucose'} 
      end
	elsif params[:exit] != nil
	  respond_to do |format|
        format.html { render 'details/show_investigations' }
      end
	elsif params[:next] != nil
	  edit_investigations()
	  respond_to do |format|
        format.html 
      end
	else
	  edit_investigations()
	  respond_to do |format|
        format.html
      end
	end
	# Please don't render here 
  	
  end


end
