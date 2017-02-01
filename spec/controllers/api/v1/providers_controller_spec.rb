require 'rails_helper'

RSpec.describe Api::V1::ProvidersController, type: :controller do

  describe "#index" do
    let!(:provider) { FactoryGirl.create(:provider) }
    let!(:provider_2) { FactoryGirl.create(:provider) }
    let!(:appointment) { FactoryGirl.create(:appointment, provider: provider) }

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "displays json data for all providers" do
      get :index
      json = JSON.parse(response.body)

      expect(json.length).to eq(2)
      expect(json[0]["name"]).to eq(provider.name)
      expect(json[1]["name"]).to eq(provider_2.name)

      expect(json[0]["appointments"].length).to eq(1)
      expect(json[1]["appointments"].length).to eq(0)
      expect(json[0]["users"][0]["id"]).to eq(appointment.user.id)
    end
  end

  xdescribe "#show" do
    let!(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "shows json for the current user" do
      user_login_google(user.password)
      get :show
      json = JSON.parse(response.body)
    end
  end

end
