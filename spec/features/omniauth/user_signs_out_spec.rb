require 'rails_helper'

RSpec.feature "user signs out" do
  before do
    User.destroy_all
    sign_in_user
  end

  scenario "it destroys the session" do
    visit root_path
    click_link "Sign Out"
    expect{session}.to raise_error(NameError)
  end

  scenario "it redirects to the home page" do
    visit root_path
    click_link "Sign Out"
    expect(page).to have_content "User Sign In"
  end

  scenario "it does not destroy the user in the database" do
    visit root_path
    click_link "Sign Out"
    expect(User.count).to eq 1
  end
end
