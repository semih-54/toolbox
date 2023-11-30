class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes
  has_many :apps, through: :votes

  def connections
    Connection
      .where("(asker_id = ? OR receiver_id = ?) AND status='accepted'", id, id)
      .map { |connection| connection.asker == self ? connection.receiver : connection.asker }
  end

  def connected_with?(user)
    asked = connections.where("(asker_id = ? AND receiver_id = ?) AND status='accepted'", id, user.id).any?
    received = connections.where("(asker_id = ? AND receiver_id = ?) AND status='accepted'", user.id, id).any?

    asked || received
  end
end
