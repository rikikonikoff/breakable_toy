require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end

end
