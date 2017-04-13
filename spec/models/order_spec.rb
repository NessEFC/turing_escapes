require 'rails_helper'

RSpec.describe Order, "associations", type: :model do
  it { should have_many(:order_escapes) }
  it { should have_many(:escapes).through(:order_escapes) }
  it { should belongs_to(:user) }
end