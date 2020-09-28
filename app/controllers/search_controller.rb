class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @model_select = params[:option]
    @sort_version = params[:sort]

    if @model_select == "word"
      @words = Word.search(params[:search], @sort_version, @model_select)
    elsif @model_select == "memo"
      @memos = Memo.search(params[:search], @sort_version, @model_select)
    elsif @model_select == "tag"
      @tags = Tag.search(params[:search], @sort_version, @model_select)
    end
  end
end
