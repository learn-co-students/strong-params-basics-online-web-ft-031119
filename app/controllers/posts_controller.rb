class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		# refactored code: @post = Post.new(params["post"])
		# refacatored code: @post = Post.new(params.require(:post).permit(:title, :description))
		@post = Post.new(post_params(:title, :description))
		@post.save
 		redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  # refactored code: @post.update(params["post"])
		# refactored code: @post.update(params.require(:post).permit(:title))
		@post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	private

	#refactored code:  def post_params
	# 	params.require(:post).permit(:title, :description)
	# end

# We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action
		def post_params(*args)
		  params.require(:post).permit(*args)
		end

end
