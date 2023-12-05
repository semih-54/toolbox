class VotesController < ApplicationController
  def create
    @app = App.find(params[:app_id])
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    @vote.save
    redirect_to apps_path
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(vote_params)
      redirect_to apps_path
    else
      raise
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to apps_path
  end

  private

  def vote_params
    params.permit(:app_id, :vote)
  end
end
