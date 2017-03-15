class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(user_params)
  	@user.save
  	if @user.errors.any? == true
  		flash[:errors] = @user.errors
  		redirect_to '/users/new'
  	else
  	session[:id] = @user.id
  	session[:name] = @user.name
  		redirect_to '/'
  	end	

  end

  def login
  	if request.post?
	  	user = User.find_by ({name:params[:name], password:params[:password]})
	  	puts "****************************************************************8"
	  	puts user	 	
	  	puts "****************************************************************8"
	  	unless user
	 		flash[:errors] = 'Incorrect login information'
	 	else
	 		session[:id] = user.id
	  		session[:name] = user.name
	  		redirect_to '/'
	  	end	
	 end 	
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
