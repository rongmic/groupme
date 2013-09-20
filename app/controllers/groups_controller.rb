class GroupsController < ApplicationController
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
    @topics = @group.topics.order('created_at desc')
    @topic = @group.topics.build
    @comment = @topic.comments.build
  end

  def join
    @group = Group.find(params[:id])

    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      redirect_to group_path(@group)
    else
      flash[:warning] = "You already joined this group."
    end
  end

  def quit
    @group = Group.find(params[:id])

    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      redirect_to group_path(@group)
    else
      flash[:warning] = "You are not member of this group."
    end
  end

  private
    def group_params
      params.require(:group).permit(:title, :description, :image)
    end
end
