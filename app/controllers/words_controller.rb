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
		redirect_to words_path
	end

	def show
	end

	def index
		@words = Word.all
	end

	def edit
		@word = Word.find(params[:id])
	end

	def update
		word = Word.find(params[:id])
		if word.update(word_params)
			flash[:notice] = "successfully updated word!"
			redirect_to words_path
		else
			render 'index'
		end
	end

	def destroy
		word = Word.find(params[:id])
		word.destroy
		@words = Word.all
		word = Word.new
		render 'index'
	end

	private
	def word_params
		params.require(:word).permit(:name, :body, :color, :pickup)
	end

end
