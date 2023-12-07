class VotesController < ApplicationController
  def create
    @app = App.find(params[:app_id])
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    @vote.save

    respond_to do |format|
      format.html { redirect_to apps_path }
      format.text { render partial: "apps/card", locals: { app: @app }, formats: [:html] }
    end
  end

  def update
    @vote = Vote.find(params[:id])
    @app = @vote.app
    @vote.update(vote_params)

    respond_to do |format|
      format.html { redirect_to apps_path }
      format.text { render partial: "apps/card", locals: { app: @app }, formats: [:html] }
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
