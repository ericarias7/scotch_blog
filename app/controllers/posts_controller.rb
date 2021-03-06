class PostsController < ApplicationController

before_action :find_post, only: [:edit, :update, :show, :delete]

def index 
	@posts = Post.all.order("created_at DESC")
	end 

def new 
	@post = Post.new
end

def create 
	@post = Post.new(post_params)
	if @post.save(post_params)
		flash[:notice] = "Successfully created post!"
		redirect_to post_path(@post)
	else 
		flash[:alert] = "Error creating new post!"
		render :new
	end
end

def edit 
end 

def update 
	if @post.update_attributes(post_params)
		flash[:notice] = "Successfully updated post!"
		redirect_to post_path(@post)
	else 
		flash[:alert] = "Error editing post!"
		render :edit 
	end 
end 

def show 
end 

def destroy 
	if @post.destroy
		flash[:notice] = "Successfully deleted post!"
		redirect_to posts_path
	else 
		flash[:alert] = "Error deleting post!"
	end 
end

private 

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end





