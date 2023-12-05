class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :app

  validates :user_id, uniqueness: { scope: :app_id }

  after_save :update_app_total_votes

  def upvoted?
    vote == 1
  end

  def downvoted?
    vote == -1
  end

  private

  def update_app_total_votes
    votes = Vote.where(app: app).sum(:vote)
    app.update(total_votes: votes)
  end
end
