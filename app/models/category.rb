class Category < ApplicationRecord
  validates :title, presence: true

  has_many :escape_categories
  has_many :escapes, through: :escape_categories
end
