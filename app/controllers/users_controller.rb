class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @user = User.find_by(id: :user_id)
  end

  def update
    @user = current_user
    @user = User.find_by(id: :user_id)
    if @user.update(user_params)
      redirect_to mypage_path, notice: "successfully updated user!"
    else
      render "edit"
    end
  end

  private
  def user_params
  	params[:user].permit(:name, :email)
  end
end