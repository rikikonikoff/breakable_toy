require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do

  describe "#update" do
    it "returns http redirect" do
      provider = FactoryGirl.create(:provider)
      put :update, id: provider.id, provider: { name: "New Name" }
      expect(response).to have_http_status(:redirect)
    end
  end

end
