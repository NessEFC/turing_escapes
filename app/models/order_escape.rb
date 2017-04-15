class OrderEscape < ApplicationRecord
  validates :total, presence: true
  validates :quantity, presence: true

  belongs_to :order
  belongs_to :escape

  def format_total
    sprintf('%.2f', total )
  end

end
