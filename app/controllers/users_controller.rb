class UsersController < ApplicationController
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

  private
    def user_params
      params.require(:user).permit(:avatar)
    end
end
