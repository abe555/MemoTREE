class MemosController < ApplicationController
	before_action :authenticate_user!

	def new
		memo = Memo.new
	end

	def create
		@memo = Memo.new(memo_params)
		@memo.user_id = current_user.id
		@memo.save
		@memos = Memo.all
		render "index"
	end

	def show
	end

	def index
		@memos = Memo.all
	end

	def edit
	end

	def update
	end

	def destroy
		memo = Memo.find(params[:id])
		memo.destroy
		@memos = Memo.all
		memo = Memo.new
		render 'index'
	end

	private
	def memo_params
		params.permit(:body, :color, :pickup)
	end

end
