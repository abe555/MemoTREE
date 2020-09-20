class PickupController < ApplicationController

  def index
  	@user = current_user
  	@words = @user.words.where(pickup: 1)
  	@memos = @user.memos.where(pickup: 1)
  end

end
