class AddForeignKeysToConnections < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :connections, :users, column: :asker_id
    add_foreign_key :connections, :users, column: :receiver_id
  end
end
