class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]

  def create
    @group = Group.find(params[:group_id])
    @topic = @group.topics.new(topic_params)

    if @topic.save
      redirect_to group_path(@group)
    else
    end
  end

  def show
    @group = @topic.group
  end

  def destroy
    group = @topic.group
    if @topic.destroy
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
