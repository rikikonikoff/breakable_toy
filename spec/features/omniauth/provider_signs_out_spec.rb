require 'rails_helper'

RSpec.feature "provider signs out" do
  before do
    Provider.destroy_all
    sign_in_provider
  end

  scenario "it destroys the session" do
    visit root_path
    click_link "Sign Out"
    expect{session}.to raise_error(NameError)
  end

  scenario "it redirects to the home page" do
    visit root_path
    click_link "Sign Out"
    expect(page).to have_content "Provider Sign In"
  end

  scenario "it does not destroy the provider in the database" do
    visit root_path
    click_link "Sign Out"
    expect(Provider.count).to eq 1
  end
end
