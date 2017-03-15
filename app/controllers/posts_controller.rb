class PostsController < ApplicationController
  def index
  	@posts = Post.includes(:comments, :user)
  	@posts.each do |post|
  		puts post.comments
  		puts post.user.name	
  	end
  	# render json:@posts
  end

  def new
  end

  def create
  	@post = Post.new(content:params[:content])
  	@post.user_id = session[:id]
  	@post.save
  	if @post.errors.any? == true
  		flash[:error] = @post.errors
  		redirect_to '/post/create'
  	else
  		redirect_to '/'
  	end
  end
end
