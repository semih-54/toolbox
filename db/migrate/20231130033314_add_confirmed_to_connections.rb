class AddConfirmedToConnections < ActiveRecord::Migration[7.1]
  def change
    add_column :connections, :confirmed, :boolean, default: false
  end
end
