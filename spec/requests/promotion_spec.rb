require "rails_helper"

RSpec.describe "Promotions", type: :request do
  describe "GET /index" do
    it "returns a success response" do
      get promotions_url
      expect(response).to be_successful
    end
  end
end
