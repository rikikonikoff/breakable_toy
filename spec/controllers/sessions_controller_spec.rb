require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "#create" do
    it "gets an HTTP success response" do
      user_login_test
      expect(response).to have_http_status(:success)
      expect(request.env["omniauth.params"]["session_type"]).to eq("user")
    end
  end

  describe "#create_user" do
    it "it creates a new user" do
      user_login_test
      user = User.find_by(name: "Purple People Eater")
      expect(user).to be_a User
      expect(user_login_test).to change(User, :count).by(1)
    end

    it "logs in an existing user" do
      user = User.create(
      name: 'Purple People Eater',
      email: 'purplepeopleeater@gmail.com',
      uid: '12345'
      )
      user_login_test
      expect(User.find(session[:user_id])).to eq(user)
    end
  end
end
