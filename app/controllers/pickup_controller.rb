class PickupController < ApplicationController

  def index
  	@words = Word.where(pickup: 1)
  	@memos = Memo.where(pickup: 1)
  end

end
