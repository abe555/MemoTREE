class SearchController < ApplicationController

def search
    @word_or_memo_or_tag = params[:option]

    if @word_or_memo_or_tag == "1"
      @words = Word.search(params[:search], @word_or_memo_or_tag)
    elsif @word_or_memo_or_tag == "2"
      @memos = Memo.search(params[:search], @word_or_memo_or_tag)
    elsif @word_or_memo_or_tag == "3"
      @tags = Tag.search(params[:search], @word_or_memo_or_tag)
    end
  end

end



