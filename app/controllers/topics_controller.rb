class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy, :like, :dislike]
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]

  def create
    @group = Group.find(params[:group_id])
    @topic = @group.topics.new(topic_params)
    @topic.user = current_user

    if @topic.save
    else
      flash[:success] = "content required"
    end
    redirect_to group_path(@group)
  end

  def show
    @group = @topic.group
    @comment = Comment.new
  end

  def destroy
    @topic = current_user.topics.find(params[:id])
    group = @topic.group
    if  @topic.destroy
      flash[:success] = "Topic has been deleted successfully."
      redirect_to group_path group
    else
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
