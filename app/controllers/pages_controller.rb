class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    if params[:user_id]
      user_for_profile = User.find(params[:user_id])
    else
      user_for_profile = current_user
    end
    @comments = Comment.where(user: user_for_profile).order(updated_at: :desc)
    @votes = Vote.where(user: user_for_profile).order(updated_at: :desc)
  end
end
