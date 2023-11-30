class RemoveStatusFromConnections < ActiveRecord::Migration[7.1]
  def change
    remove_column :connections, :status, :string
  end
end
