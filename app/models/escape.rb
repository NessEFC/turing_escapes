class Escape < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :city, presence: true
  validates :image, presence: true

  has_many :escape_categories
  has_many :categories, through: :escape_categories
  has_many :order_escapes
  has_many :orders, through: :order_escapes
end
