class FeedsController < ApplicationController

  def index
    @connections_asked = Connection.where(confirmed: true, asker: current_user).order(updated_at: :desc)
    @connections_received = Connection.where(confirmed: true, receiver: current_user).order(updated_at: :desc)
    @comments = Comment.where(user: current_user.connections).order(updated_at: :desc)
    @votes = Vote.where(user: current_user.connections).order(updated_at: :desc)
  end
end
