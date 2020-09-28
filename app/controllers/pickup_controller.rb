class PickupController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @words = @user.words.where(pickup: 1)
    @memos = @user.memos.where(pickup: 1)
  end
end
