class MemosController < ApplicationController
  before_action :authenticate_user!

  def create
    memo = Memo.new(memo_params)
    memo.user_id = current_user.id
    if memo.save
      flash[:notice] = "successfully created memo!"
      redirect_to memos_path
    else
      render 'index'
    end
  end

  def index
    memo = Memo.new
    @user = current_user
    @memos = @user.memos.page(params[:page]).reverse_order.per(10)
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    if memo.update(memo_params)
      flash[:notice] = "successfully updated memo!"
      redirect_to memos_path
    else
      render 'index'
    end
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    @memos = @user.memos.page(params[:page]).reverse_order.per(10)
    memo = Memo.new
    render 'index'
  end

  private

  def memo_params
    params.require(:memo).permit(:body, :color, :pickup)
  end
end
