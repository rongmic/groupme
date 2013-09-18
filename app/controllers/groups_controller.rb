class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @topics = @group.topics.order('created_at desc')
    @topic = @group.topics.build
  end

  private
    def group_params
      params.require(:group).permit(:title, :description, :image)
    end
end
