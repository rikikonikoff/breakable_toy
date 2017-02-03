require 'rails_helper'

RSpec.feature "provider signs in" do
  before(:each) do
    Provider.destroy_all
  end

  it 'signs in a provider' do
    sign_in_provider
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Appointments")
  end

  it "creates a new provider" do
    sign_in_provider
    provider = Provider.find_by(name: "Purple People Eater")
    expect(provider).to be_a Provider
    expect(Provider.count).to eq 1
  end

  it "signs in a provider that exists" do
    provider = FactoryGirl.create(:provider)
    sign_in_provider(provider.uid)
    expect(page).to have_content("Sign Out")
    expect(Provider.count).to eq 1
  end
end
