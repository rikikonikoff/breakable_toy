require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do

  xdescribe "#update" do

    it "returns http success" do
      provider = FactoryGirl.create(:provider)
      put :update, provider: {id: provider.id}
      expect(response).to have_http_status(:success)
    end
  end

end
