require 'rails_helper'

RSpec.feature "provider views appointments" do
  scenario "provider navigates to own view page and sees own appointments" do
    provider = FactoryGirl.create(:provider)
    appointment_1 = FactoryGirl.create(:appointment, provider: provider)
    appointment_2 = FactoryGirl.create(:appointment, provider: provider)

    visit root_path
    sign_in_provider(provider.uid)
    expect(page).to have_content appointment_1.date.strftime("%a, %B %d %Y")
    expect(page).to have_content appointment_1.start_time.strftime("%I:%M%p")
    expect(page).to have_content appointment_1.end_time.strftime("%I:%M%p")
    expect(page).to have_content appointment_2.date.strftime("%a, %B %d %Y")
    expect(page).to have_content appointment_2.start_time.strftime("%I:%M%p")
    expect(page).to have_content appointment_2.end_time.strftime("%I:%M%p")
  end

  scenario "provider views all appointments" do
    
  end
end
