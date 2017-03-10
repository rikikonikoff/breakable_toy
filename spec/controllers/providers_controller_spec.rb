require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do

  describe "#new" do
    it "returns http success" do
      Provider.new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "returns http redirect" do
      request.env["HTTP_REFERER"] = '/providers/new'
      post :create, provider: { name: "Foob" }, session: {
        auth: { "info" => {
          "name" => "Foob", "email" => "foob@example.com", "image" => "123.jpg"
        } }
      }
      expect(response).to have_http_status(:redirect)
      expect(Provider.find_by(name: "Foob").email).to eq("foob@example.com")
      expect(Provider.find_by(name: "Foob").remote_avatar_url).to eq("123.jpg")
    end
  end

  describe "#edit" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    it "returns http redirect" do
      provider = FactoryGirl.create(:provider)
      put :update, id: provider.id, provider: { name: "New Name" }
      expect(response).to have_http_status(:redirect)
    end
  end
end
