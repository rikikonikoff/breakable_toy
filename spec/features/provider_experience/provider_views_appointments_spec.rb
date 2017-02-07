require 'rails_helper'

RSpec.feature "provider views appointments" do
  let!(:provider) { FactoryGirl.create(:provider) }
  let!(:appointment_1) { FactoryGirl.create(:appointment, provider: provider) }
  let!(:appointment_2) { FactoryGirl.create(:appointment, provider: provider) }
  let!(:appointment_3) { FactoryGirl.create(:appointment, date: Date.tomorrow) }

  scenario "provider navigates to own view page and sees own appointments" do
    visit root_path
    sign_in_provider(provider.uid)
    expect(page).to have_content appointment_1.date.strftime("%a, %B %d %Y")
    expect(page).to have_content appointment_1.start_time.strftime("%I:%M%p")
    expect(page).to have_content appointment_1.end_time.strftime("%I:%M%p")
    expect(page).to have_content appointment_2.date.strftime("%a, %B %d %Y")
    expect(page).to have_content appointment_2.start_time.strftime("%I:%M%p")
    expect(page).to have_content appointment_2.end_time.strftime("%I:%M%p")
  end

  scenario "provider views own appointments on appointmnts index page" do
    visit root_path
    sign_in_provider(provider.uid)
    click_link "My Appointments"

    expect(page).to have_content appointment_1.date.strftime("%a %B %d, %Y")
    expect(page).to have_content appointment_2.date.strftime("%a %B %d, %Y")
    expect(page).to_not have_content appointment_3.date.strftime("%a %B %d, %Y")
  end
end
