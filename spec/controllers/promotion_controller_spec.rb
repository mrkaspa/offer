require "rails_helper"

RSpec.describe PromotionsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      create(:promotion)

      get :index
      expect(response).to be_successful
      expect(assigns(:promotions).count).to eq(1)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      promotion = create(:promotion)
      get :show, params: { id: promotion.id }
      expect(response).to be_successful
    end

    it "assigns the requested promotion as @promotion" do
      promotion = create(:promotion)
      get :show, params: { id: promotion.id }
      expect(assigns(:promotion)).to eq(promotion)
    end

    it "returns a 404 response if the promotion is not found" do
      get :show, params: { id: 999 }
      expect(response).to be_not_found
    end
  end

  describe "POST #create" do
    it "returns a success response" do
      post :create, params: { promotion: attributes_for(:promotion) }
      expect(response).to be_successful
    end

    it "creates a new promotion" do
      expect {
        post :create, params: { promotion: attributes_for(:promotion) }
      }.to change(Promotion, :count).by(1)
    end

    it "returns a 422 response if the promotion is not valid" do
      post :create, params: { promotion: attributes_for(:promotion, name: nil) }
      expect(response.status).to eq(422)
      expect(response.body).to include("Name can't be blank")
    end
  end

  describe "PUT #update" do
    it "returns a success response" do
      promotion = create(:promotion)
      put :update, params: { id: promotion.id, promotion: attributes_for(:promotion) }
      expect(response).to be_successful
    end

    it "updates the promotion" do
      promotion = create(:promotion)
      put :update, params: { id: promotion.id, promotion: attributes_for(:promotion, name: "New Name") }
      expect(promotion.reload.name).to eq("New Name")
    end

    it "returns a 422 response if the promotion is not valid" do
      promotion = create(:promotion)
      put :update, params: { id: promotion.id, promotion: attributes_for(:promotion, name: nil) }
      expect(response.status).to eq(422)
      expect(response.body).to include("Name can't be blank")
    end
  end

  describe "DELETE #destroy" do
    it "returns a success response" do
      promotion = create(:promotion)
      delete :destroy, params: { id: promotion.id }
      expect(response).to be_successful
    end

    it "deletes the promotion" do
      promotion = create(:promotion)
      expect {
        delete :destroy, params: { id: promotion.id }
      }.to change(Promotion, :count).by(-1)
    end

    it "returns a 404 response if the promotion is not found" do
      delete :destroy, params: { id: 999 }
      expect(response).to be_not_found
    end
  end
end
