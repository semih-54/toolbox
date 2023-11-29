class Category < ApplicationRecord
  has_many :app_categories
  has_many :apps, through: :app_categories
end
