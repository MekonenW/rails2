class IdeasController < ApplicationController
  def index
    @user= User.find(session[:user_id])
    @ideas= Idea.joins(:likes).group(:idea_id).order("(likes.idea_id) DESC")
    @ideas= Idea.all
    @likes= Like.all

  end

  def new
  end

  def create
    idea= Idea.new(idea_params)
    idea[:user_id]= session[:user_id]
    if idea.save
      redirect_to '/ideas'
    else
      flash[:errors]= "Idea can't be blank"
      redirect_to '/ideas'
    end
  end

  def show
    @user= User.find(session[:user_id])
    @idea= Idea.find(params[:id])
    @likes= Like.all
  end

  def destroy
    idea= Idea.find(params[:id])
    idea.destroy
    redirect_to '/ideas'
  end

  private 
    def idea_params
      params.require(:idea).permit(:idea, :user_id)
    end
end
