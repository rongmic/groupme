class LikesController < ApplicationController
  before_action :login_required
  before_action :find_likeable_topic

  def create
    current_user.like(@topic)
    render text: @topic.likers.count
  end

  def destroy
    current_user.dislike(@topic)
    render text: @topic.likers.count
  end

  private

  def find_likeable_topic
    @topic = Topic.find(params[:id])
  end
end
