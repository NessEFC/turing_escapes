class Order < ApplicationRecord
  has_many :order_escapes
  has_many :escapes, through: :order_escapes
  belongs_to :user

  def format_created_at
    created_at.strftime("%B %e, %Y")
  end
end
