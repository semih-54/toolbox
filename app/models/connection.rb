class Connection < ApplicationRecord
  belongs_to :asker, class_name: "User", foreign_key: "asker_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
end
