class SessionsController < ApplicationController
	def new
	end

	def create
		user= User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id]= user.id 
			session[:alias]= user.alias
			redirect_to '/ideas'
		else
			flash[:error]= "Invalid email or password"
			redirect_to '/'
		end 
	end

	def destroy
		session[:user_id]= nil
	  redirect_to '/'
	end
end
