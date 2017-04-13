class Order < ApplicationRecord
  has_many :order_escapes
  has_many :escapes, through: :order_escapes
  belongs_to :user
end
