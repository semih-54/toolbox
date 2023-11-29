class CreateApps < ActiveRecord::Migration[7.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.integer :total_votes

      t.timestamps
    end
  end
end
