class AddTotalVotesG2ToApps < ActiveRecord::Migration[7.1]
  def change
    add_column :apps, :total_vote_g2, :integer
  end
end
