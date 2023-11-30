class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # after_create :create_connection

  has_many :votes
  has_many :apps, through: :votes
  has_many :sent_connections, class_name: 'Connection', foreign_key: "asker_id"
  has_many :received_connections, class_name: 'Connection', foreign_key: "receiver_id"
  has_many :pending_connections, -> {where confirmed: false}, class_name: 'Connection', foreign_key: "receiver_id"

  # def create_connection
  #   raise
  #   Connection.new(as)
  # end

  def friends
    friends_i_sent_link = Connection.where(asker_id: id, confirmed: true).pluck(:receiver_id)
    friends_i_got_link = Connection.where(receiver_id: id, confirmed: true).pluck(:asker_id)
    ids = friends_i_sent_link + friends_i_got_link
    User.where(id: ids)
  end

  def connected?(user)
    Connection.confirmed_record?(id, user.id)
  end

  def send_link(user)
    connections.create(receiver_id: user.id)
  end
end
