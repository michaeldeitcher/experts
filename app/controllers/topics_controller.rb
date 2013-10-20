class TopicsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
