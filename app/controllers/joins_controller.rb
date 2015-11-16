class JoinsController < ApplicationController
    before_action :authenticate_user

    def create
      join = Join.new
      idea = Idea.find params[:idea_id]
      join.idea = idea
      join.user = current_user
      if current_user != idea.user
        join.save
        redirect_to idea_path(idea), notice: "Thanks for Join"
      else
        redirect_to idea_path(idea), alert: "You can't Join in your own idea"
      end
    end

    def destroy
      idea = Idea.find params[:idea_id]
      join = current_user.joins.find params[:id]
      join.destroy
      redirect_to idea_path(idea)
    end

end
