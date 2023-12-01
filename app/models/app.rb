class App < ApplicationRecord
  DESCRIPTION_LENGTH = 50
  NAME_LENGTH = 17
  CATEGORY_LENGTH = 30

  has_many :votes
  has_many :users, through: :votes

  has_many :app_categories
  has_many :categories, through: :app_categories

  def self.recommended_by(connections)
    App.joins(:votes).where(votes: { user: connections, vote: 1 }).group(:id)
  end

  def reccommenders(connections)
    connections.select { |connection| votes.where(user: connection.receiver).or(votes.where(user: connection.asker)) }
  end
end
