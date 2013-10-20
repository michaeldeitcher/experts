class BailiwicksController < ApplicationController
  before_filter :authenticate_user!

  def new
    @topic = Topic.find(params[:topic_id])
    @bailiwick = @topic.bailiwicks.build(:role => params[:role])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bailiwick = @topic.bailiwicks.build bailiwick_params
    @bailiwick.user = current_user
    if(@bailiwick.save)
      redirect_to(topic_path(@topic))
    else
      render :new
    end
  end

  private
  def bailiwick_params
    return {} unless params[:bailiwick].present?
    params.require(:bailiwick).permit(:rank, :affinity, :role)
  end
end
