require 'rails_helper'

RSpec.feature "user signs in" do
  before(:each) do
    User.destroy_all
  end

  it 'signs in a user' do
    sign_in_user
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Appointments")
  end

  it "creates a new user" do
    sign_in_user
    user = User.find_by(name: "Purple People Eater")
    expect(user).to be_a User
    expect(User.count).to eq 1
  end

  it "signs in a user that exists" do
    user = FactoryGirl.create(:user)
    sign_in_user(user.uid)
    expect(page).to have_content("Sign Out")
    expect(User.count).to eq 1
  end
end
