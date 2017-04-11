require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
end

RSpec.describe Category, "associations", type: :model do
  it { should have_many(:escape_categories) }
  it { should have_many(:escapes).through(:escape_categories) }
end