require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do

  xdescribe "#update" do
    it "returns http success" do
      put :update
      expect(response).to have_http_status(:success)
    end
  end

end
