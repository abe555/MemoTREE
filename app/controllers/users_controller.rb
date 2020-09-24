class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @tags = @user.tags.all
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to mypage_path, notice: "successfully updated user!"
    else
      render "edit"
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email)
  end
end
