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
		@memo = Memo.find(params[:id])
	end

	def update
		memo = Memo.find(params[:id])
		if memo.update(memo_params)
			flash[:notice] = "successfully updated memo!"
			redirect_to memos_path
		else
			render 'index'
		end
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
		params.require(:memo).permit(:body, :color, :pickup)
	end

end
