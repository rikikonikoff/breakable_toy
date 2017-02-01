require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: :controller do

  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "displays json data for all appointments" do
      get :index
      json = JSON.parse(response.body)
    end
  end

end
