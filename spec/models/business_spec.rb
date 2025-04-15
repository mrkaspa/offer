require 'rails_helper'

RSpec.describe Business, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      business = create(:business)
      expect(business).to be_valid
    end

    it "is invalid without a name" do
      business = build(:business, name: nil)
      expect(business).to be_invalid
      expect(business.errors[:name]).to include("can't be blank")
    end
  end
end
