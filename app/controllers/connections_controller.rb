class ConnectionsController < ApplicationController
  def create
    Connection.create(asker:current_user)
    redirect_to profile_path
  end
end
