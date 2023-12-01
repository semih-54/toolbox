class UpdateTotalVotesFromApps < ActiveRecord::Migration[7.1]
  def change
    change_column :apps, :total_votes, :integer, default: 0
  end
end
