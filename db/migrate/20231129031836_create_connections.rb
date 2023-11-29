class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.string :status
      t.integer :asker_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
