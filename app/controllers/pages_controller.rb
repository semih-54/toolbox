class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @users = []

    if params[:query].present?
      @users = User.where("username ILIKE ? AND username <> ?", "%#{params[:query]}%", current_user.username)
      connections = current_user.friends.pluck(:username)
      @users = @users.where.not(username:connections)
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pages/users_list", locals: {users: @users}, formats: [:html] }
    end
  end
end
