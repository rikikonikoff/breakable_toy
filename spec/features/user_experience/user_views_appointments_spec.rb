require 'rails_helper'

RSpec.feature "user views appointments" do
  let!(:provider) { FactoryGirl.create(:provider) }
  let!(:appointment) do
    FactoryGirl.create(:appointment, provider: provider, booked?: false)
  end
  let!(:appointment_2) do
    FactoryGirl.create(:appointment, date: Date.tomorrow)
  end
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user views all appointments" do
    sign_in_user(user.uid)
    click_link "Appointments"

    expect(page).to have_content appointment.date.strftime("%a %B %d, %Y").to_s
    expect(page).to have_content appointment_2.date.strftime("%a %B %d, %Y").to_s
  end

  xscenario "user views one provider's appointments", js: true do
    sign_in_user(user.uid)
    find_content("#{provider.name}").trigger(click)
    click_link "See My Appointments"

    expect(page).to have_content appointment.date.strftime("%a %B %d, %Y").to_s
    expect(page).to_not have_content appointment_2.date.strftime("%a %B %d, %Y").to_s
  end

  scenario "user views an individual appointment" do
    visit root_path
    sign_in_user(user.uid)
    click_link "Appointments"
    @link = appointment.date.strftime("%a %B %d, %Y").to_s + " @ "
    @link += appointment.start_time.strftime("%I:%M%p").to_s
    click_link @link

    expect(page).to have_content "Booked: false"
  end

  scenario "user views own booked appointments" do
    sign_in_user(user.uid)
    click_link "Appointments"
    @link = appointment.date.strftime("%a %B %d, %Y").to_s + " @ "
    @link += appointment.start_time.strftime("%I:%M%p").to_s
    click_link @link
    click_button "Book Appointment"
    click_link "View My Booked Appointments"

    expect(page).to have_content @link
  end
end
