class WordsController < ApplicationController
	before_action :authenticate_user!

	def create
		@word = Word.new(word_params)
		@word.user_id = current_user.id
		@word.save
		@user = current_user
		@words = @user.words.page(params[:page]).reverse_order.per(8)
		redirect_to words_path
	end

	def index
		word = Word.new
		@user = current_user
		@words = @user.words.page(params[:page]).reverse_order.per(8)
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
		@user = current_user
		@words = @user.words.page(params[:page]).reverse_order.per(8)
		word = Word.new
		render 'index'
	end

	private
	def word_params
		params.require(:word).permit(:name, :body, :color, :pickup)
	end

end
