class CommentsController < ApplicationController
  def index
  	comments = Comment.all
  	render json: comments
  end

  def new
  end

  def create
  	puts "*********************"
  	puts params[:comment]
  	puts "**********************"
  	@comment = Comment.new({content:params[:content], post_id:params[:post_id]})
  	@comment.user_id = session[:id]
  	@comment.save
  	redirect_to '/'
  end
end
