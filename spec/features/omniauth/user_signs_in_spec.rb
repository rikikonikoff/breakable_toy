require 'rails_helper'

RSpec.feature "user signs in" do
  before do
    user_login_test
  end

  xscenario "gets an HTTP success response" do
    expect(response).to have_http_status(:success)
    expect(request.env["omniauth.params"]["session_type"]).to equal "user"
  end

  xscenario "it creates a new user" do
    User.destroy_all
    user_login_test

    expect(User.count).to equal 1
  end

  xscenario "it logs in an existing user" do
    User.destroy_all
    user = User.create(
      name: 'Purple People Eater',
      email: 'purplepeopleeater@gmail.com',
      uid: '123545'
    )
    user_login_test

    expect(User.count).to equal 1
    expect(session[:user_id]).to equal user.id
  end
end
