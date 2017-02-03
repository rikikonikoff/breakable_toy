require 'rails_helper'

RSpec.feature "provider edits an existing appointment" do
  scenario "edits an appointment" do
    provider = FactoryGirl.create(:provider)
    appointment = FactoryGirl.create(:appointment, provider: provider)
    sign_in_provider(provider.uid)
    click_link "#{appointment.date.strftime("%a, %B %d %Y")}: #{appointment.start_time.strftime("%I:%M%p")} - #{appointment.end_time.strftime("%I:%M%p")}"
    click_link "Edit this Appointment"

    within("#appointment_date_1i") do
      select("2019")
    end

    within("#appointment_date_2i") do
      select("June")
    end

    within("#appointment_date_3i") do
      select("15")
    end

    within("#appointment_start_time_4i") do
      select("07 PM")
    end

    within("#appointment_end_time_4i") do
      select("08 PM")
    end

    click_button "Add To My Appointments"

    expect(page).to have_content "June 15 2019: 07:00PM - 08:00PM"
    expect(page).to have_content "Appointment Updated"
  end
end
