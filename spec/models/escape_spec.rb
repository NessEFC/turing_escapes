require 'rails_helper'

RSpec.describe Escape, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
     it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:price) }
       it { is_expected.to validate_presence_of(:city) }
        it { is_expected.to validate_presence_of(:image) }
  end
end