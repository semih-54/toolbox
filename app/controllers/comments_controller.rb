class CommentsController < ApplicationController
  def create
    @app = App.find(params[:app_id])
    @comment = Comment.new(comment_params)
    @comment.app = @app
    @comment.user = current_user
    if @comment.save
      redirect_to app_path(@app)
    else
      render "apps/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
