class MemosController < ApplicationController
	before_action :authenticate_user!

	def create
		memo = Memo.new(memo_params)
		memo.user_id = current_user.id
		memo.save
		@memos = Memo.all
		redirect_to memos_path
	end

	def show
	end

	def index
		@memo = Memo.new
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

	def tag
		@user = current_user
		@hashtag = Tag.find_by(hashname: params[:name])
		@memos = @hashtag.memo.build
		@memo = @hashtag.memo.page(params[:page])
	end


	private
	def memo_params
		params.require(:memo).permit(:body, :color, :pickup)
	end

end
