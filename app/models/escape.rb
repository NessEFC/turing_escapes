class Escape < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, :numericality => {:greater_than => 0}
  validates :city, presence: true

  has_attached_file :photo, styles: { medium: "360x207>", thumb: "100x58>" }, default_url: ActionController::Base.helpers.asset_path("default_escape.png")
  validates_attachment :photo,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  has_many :escape_categories
  has_many :categories, through: :escape_categories
  has_many :order_escapes
  has_many :orders, through: :order_escapes

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
