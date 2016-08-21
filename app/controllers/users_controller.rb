class UsersController < ApplicationController
  def index
  end

  def create
  	@user= User.new(user_params)
  	if @user.save
  		session[:user_id]= @user.id
  		session[:alias]= @user.alias
  		redirect_to '/ideas'
  	else
  		flash[:errors]= @user.errors.full_messages
  		redirect_to '/'
  	end
  end

  def show
  	@user= User.find(params[:id])
  	@ideas= Idea.where(user_id: @user.id).count
  	@likes= Like.where(user_id: @user.id).count
    
  end
  private 
  	def user_params
  		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  	end
end
