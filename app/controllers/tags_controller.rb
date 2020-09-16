class TagsController < ApplicationController

	def new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def Tag.search(search, word_or_memo_or_tag)
		if word_or_memo_or_tag == "3"
			Tag.where(['hashname LIKE ?', "%#{search}%"])
		else
			Tag.all
		end
	end

end
