class AppCategory < ApplicationRecord
  belongs_to :app
  belongs_to :category
end
