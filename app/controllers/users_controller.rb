class UsersController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :set_patient, :set_visit

  def select_views_in_layout
    @show_patient_info = false
    @show_visit_info = false
    @show_header = true
    @show_left_bar = true
    @leave_space_for_left_bar = true
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # GET /users
  # GET /users.json
  def index
    @patient = Patient.new
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def draw_charts
      @tag = params[:tag]
      if @tag=='Both'
        @chart_values = Chart.where("date(xvalue) > ?", 10.days.ago).order("xvalue ASC")
      else
        @chart_values = Chart.where( tag: @tag).where("date(xvalue) > ?", 10.days.ago).order("xvalue ASC")
      end
      respond_to do |format|
          format.json {render json: @chart_values}
      end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    #@user = User.find(params[:id])
    @user = current_user
    respond_to do |format|
      #binding.pry
      if @user.update_attributes(params[:user])
        format.html { redirect_to '/users/'+@user.id.to_s+'/edit', notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end
