class FollowUpsController < DetailsController

  def index

    @follow_up = FollowUp.find_by_visit_id(user_session[:current_visit_id])
    if @follow_up
      respond_to do |format|
        format.html { render 'follow_ups/edit'}
      end

    else
      @follow_up = FollowUp.new
      respond_to do |format|
        format.html { render 'follow_ups/new'}
      end
    end

  end

  def show
    @follow_up = FollowUp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @follow_up }
    end
  end

  def new
    @follow_up = FollowUp.find_by_visit_id(user_session[:current_visit_id])
    if @follow_up
      respond_to do |format|
        format.html { render 'follow_ups/edit'}
      end

    else
      @follow_up = FollowUp.new
      respond_to do |format|
        format.html # new.html.erb
      end
    end

  end

  def edit
    @follow_up = FollowUp.find(params[:id])
  end

  def create
    params[:follow_up][:visit_id] = user_session[:current_visit_id]
    @follow_up = FollowUp.new(params[:follow_up])

    respond_to do |format|
      if @follow_up.save
        format.html { render 'details/show' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @follow_up = FollowUp.find(params[:id])

    respond_to do |format|
      if @follow_up.update_attributes(params[:follow_up])
        format.html { render 'details/show' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @follow_up = FollowUp.find(params[:id])
    @follow_up.destroy

    respond_to do |format|
      format.html { redirect_to follow_ups_url }
      format.json { head :no_content }
    end
  end
end
