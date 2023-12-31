class App < ApplicationRecord
  DESCRIPTION_LENGTH = 150
  NAME_LENGTH = 25
  CATEGORY_LENGTH = 30
  COMMENT_LENGTH = 100

  has_many :votes
  has_many :users, through: :votes

  has_many :app_categories
  has_many :categories, through: :app_categories
  has_many :comments

  def self.recommended_by(connections)
    App.joins(:votes).where(votes: { user: connections, vote: 1 }).group(:id)
  end

  def reccommenders(connections)
    connections.select { |connection| votes.where(user: connection.receiver).or(votes.where(user: connection.asker)) }
  end
end
