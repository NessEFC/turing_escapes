class Escape < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, :numericality => {:greater_than => 0}

  validates :city, presence: true
  validates :image, presence: true
  has_many :escape_categories
  has_many :categories, through: :escape_categories
  has_many :order_escapes
  has_many :orders, through: :order_escapes

  #enum active: %w(active retired)

  def format_price
    sprintf('%.2f', price)
  end

  def status
    if active
      "Current"
    else
      "Retired"
    end
  end

  def update_status(params)
    if params == "active"
      update(active: true)
    else
      update(active: false)
    end
  end
end
