require 'rails_helper'

RSpec.describe Promotion, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      promotion = build(:promotion)
      expect(promotion).to be_valid
    end

    it "is invalid without a name" do
      promotion = build(:promotion, name: nil)
      expect(promotion).to be_invalid
      expect(promotion.errors[:name]).to include("can't be blank")
    end
  end
end
