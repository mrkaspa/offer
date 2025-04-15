require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      business = create(:business)
      get :index
      expect(response).to be_successful
      expect(assigns(:businesses)).to eq([ business ])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      business = create(:business)
      get :show, params: { id: business.id }
      expect(response).to be_successful
    end

    it "assigns the requested business as @business" do
      business = create(:business)
      get :show, params: { id: business.id }
      expect(assigns(:business)).to eq(business)
    end

    it "returns a 404 response if the business is not found" do
      get :show, params: { id: 999 }
      expect(response).to be_not_found
    end
  end

  describe "POST #create" do
    it "returns a success response" do
      post :create, params: { business: attributes_for(:business) }
      expect(response).to be_successful
    end

    it "creates a new business" do
      expect {
        post :create, params: { business: attributes_for(:business) }
      }.to change(Business, :count).by(1)
    end

    it "returns a 422 response if the business is not valid" do
      post :create, params: { business: attributes_for(:business, name: nil) }
      expect(response.status).to eq(422)
      expect(response.body).to include("Name can't be blank")
    end
  end

  describe "PUT #update" do
    it "returns a success response" do
      business = create(:business)
      put :update, params: { id: business.id, business: attributes_for(:business) }
      expect(response).to be_successful
    end

    it "updates the business" do
      business = create(:business)
      put :update, params: { id: business.id, business: attributes_for(:business, name: "New Name") }
      expect(business.reload.name).to eq("New Name")
    end

    it "returns a 422 response if the business is not valid" do
      business = create(:business)
      put :update, params: { id: business.id, business: attributes_for(:business, name: nil) }
      expect(response.status).to eq(422)
      expect(response.body).to include("Name can't be blank")
    end
  end

  describe "DELETE #destroy" do
    it "returns a success response" do
      business = create(:business)
      delete :destroy, params: { id: business.id }
      expect(response).to be_successful
    end

    it "deletes the business" do
      business = create(:business)
      expect {
        delete :destroy, params: { id: business.id }
      }.to change(Business, :count).by(-1)
    end
  end
end
