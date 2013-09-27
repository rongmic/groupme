class UsersController < ApplicationController
  before_action :login_required, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      render text: 'success'
    else
    end
  end

  def show
    @user = User.find(params[:id])
    @latest_groups = Group.latest_groups(@user)
    @latest_topics = Topic.latest_topics(@user)
    @latest_users = User.latest
  end

  private
    def user_params
      params.require(:user).permit(:avatar)
    end
end
