class TagsController < ApplicationController

  def show
  	@user = current_user
  	@tag = Tag.find(params[:id])
  	@words = @tag.words
  	@word_relations = @tag.word_relations

  	@memos = @tag.memos
  end

end
