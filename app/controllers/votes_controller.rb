class VotesController < ApplicationController
  def create
    @app = App.find(params[:app_id])
    @vote = Vote.new
    @vote.user = current_user
    @vote.app = @app
    @vote.vote = params[:vote]
    @vote.save
    redirect_to apps_path
  end

  def update
    @vote = Vote.find(params[:app_id, :current_user])
    @vote.update(vote_params)
    redirect_to apps_path
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to apps_path
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :app_id)
  end
end
