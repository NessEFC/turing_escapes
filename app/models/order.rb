class Order < ApplicationRecord
  has_many :order_escapes
  has_many :escapes, through: :order_escapes
  belongs_to :user

  def format_created_at
    created_at.strftime("%B %e, %Y")
  end

  def format_updated_at
    updated_at.strftime("%B %e, %Y")
  end

  def subtotal(escape_id, quantity)
    sprintf('%.2f', (Escape.find(escape_id).price * quantity))
  end

  def format_total
    sprintf('%.2f', total )
  end
end
