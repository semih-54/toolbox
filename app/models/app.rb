class App < ApplicationRecord
  has_many :app_categories
  has_many :categories, through: :app_categories
end
