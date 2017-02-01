require 'rails_helper'

RSpec.feature "user signs in" do

  xscenario "gets an HTTP success response" do
    visit root_path
    click_link 'User Sign In'
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth
    expect(response).to have_http_status(:success)
    expect(request.env["omniauth.params"]["session_type"]).to equal "user"
  end

  xscenario "it creates a new user" do
    User.destroy_all
    visit root_path
    click_link 'User Sign In'
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth

    expect(User.count).to equal 1
  end

  xscenario "it logs in an existing user" do
    User.destroy_all
    user = User.create(name: 'Purple People Eater',
    email: 'purplepeopleeater@gmail.com', uid: '123545')
    visit root_path
    click_link 'User Sign In'
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth

    expect(User.count).to equal 1
    expect(session[:user_id]).to equal user.id
  end
end
