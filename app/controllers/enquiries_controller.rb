class EnquiriesController < ApplicationController

  def select_views_in_layout
    @show_patient_info = false
    @show_visit_info = false
    @show_header = true
    @show_left_bar = true
    @leave_space_for_left_bar = true
  end
  
  def new
  	@enquiry = Enquiry.new
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enquiry }
    end
  end

  def create
    @enquiry = Enquiry.new(params[:enquiry])

    respond_to do |format|
      if @enquiry.save
        format.html { redirect_to '/enquiries/new', notice: 'Your message was sent successfully.' }
        format.json { render json: @enquiry, status: :created, location: @enquiry }
        DeviseMailer.enquiry_mail(@enquiry.id).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

end
