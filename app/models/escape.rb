class Escape < ApplicationRecord
  has_many :escape_categories
  has_many :categories, through: :escape_categories
end
