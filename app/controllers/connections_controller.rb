class ConnectionsController < ApplicationController
  def create
    connection = Connection.create(asker: current_user)

    if params[:receiver_id]
      connection.receiver_id = params[:receiver_id]
      connection.confirmed = true
      connection.save
    end

    redirect_to profile_path
  end
end
