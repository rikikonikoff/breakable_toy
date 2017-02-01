require 'rails_helper'

RSpec.feature "provider signs out" do
  before do
    provider_login_google(password)
  end

  xscenario "it returns http success" do
    visit root_path
    click_link "Sign Out"
    expect(response).to have_http_status(:success)
  end

  xscenario "it destroys the session" do
    if !session[:user_id].nil? || !session[:provider_id].nil?
      visit root_path
      click_link "Sign Out"
    end
    expect(session[:user_id]).to be_nil
    expect(session[:provider_id]).to be_nil
  end

  xscenario "it redirects to the home page" do
    visit root_path
    click_link "Sign Out"
    response.should redirect_to root_url
  end

  xscenario "it does not destroy the provider in the database" do

  end
end
