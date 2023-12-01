class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :app

  validates :user_id, uniqueness: { scope: :app_id }

  after_save :update_app_total_votes

  def update_app_total_votes
    total_votes = app.total_votes + vote
    app.update(total_votes: total_votes)
  end
end
