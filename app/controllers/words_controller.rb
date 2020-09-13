class WordsController < ApplicationController
	before_action :authenticate_user!

	def new
		word = Word.new
	end

	def create
		@word = Word.new(word_params)
		@word.user_id = current_user.id
		@word.save
		@words = Word.all
		render 'index'
	end

	def show
	end

	def index
		@words = Word.all
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def word_params
		params.permit(:name, :body, :color, :pickup)
	end

end
