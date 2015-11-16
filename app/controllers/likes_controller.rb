class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    like = Like.new
    idea = Idea.find params[:idea_id]
    like.idea = idea
    like.user = current_user
    if current_user != idea.user
      like.save
      redirect_to idea_path(idea), notice: "Thanks for like"
    else
      redirect_to idea_path(idea), alert: "You can't Like in your own idea"
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to idea_path(idea)
  end


end
