require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#create" do
    it "returns http redirect" do
      post :create, user: { name: "Foob" }, session: {
        auth: { "info" => { "name" => "Foob", "email" => "foob@example.com" } }
      }
      expect(response).to have_http_status(:redirect)
      expect(User.find_by(name: "Foob").email).to eq("foob@example.com")
    end
  end

end
