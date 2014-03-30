class DescriptionsController < ApplicationController
  # GET /descriptions
  # GET /descriptions.json
  def index
    @descriptions = Description.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @descriptions }
    end
  end

  # GET /descriptions/1
  # GET /descriptions/1.json
  def show
    @description = Description.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @description }
    end
  end

  # GET /descriptions/new
  # GET /descriptions/new.json
  def new
    @description = Description.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @description }
    end
  end

  # GET /descriptions/1/edit
  def edit
    @description = Description.find(params[:id])
  end

  # POST /descriptions
  # POST /descriptions.json
  def create
    @description = Description.new(params[:description])

    respond_to do |format|
      if @description.save
        format.html { redirect_to @description, notice: 'Description was successfully created.' }
        format.json { render json: @description, status: :created, location: @description }
      else
        format.html { render action: "new" }
        format.json { render json: @description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /descriptions/1
  # PUT /descriptions/1.json
  def update
    @description = Description.find(params[:id])

    respond_to do |format|
      if @description.update_attributes(params[:description])
        format.html { redirect_to @description, notice: 'Description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descriptions/1
  # DELETE /descriptions/1.json
  def destroy
    @description = Description.find(params[:id])
    @description.destroy

    respond_to do |format|
      format.html { redirect_to descriptions_url }
      format.json { head :no_content }
    end
  end
end
