class LikesController < ApplicationController
  def index
    @likes= Like.all
  end

  def new
  end

  def create
    @idea= Idea.find(params[:id])
    @idea.increment!(:likes)
    @idea.create_activity :like
    @idea.save
    @like= Like.new(like_params)
    @like.save
    redirect_to '/ideas'
  end

  def show
  end

  private 
    def like_params
      params.require(:like).permit(:user_id, :idea_id)
    end
end
