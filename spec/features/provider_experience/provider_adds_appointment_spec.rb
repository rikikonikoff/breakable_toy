require 'rails_helper'

RSpec.feature "provider adds an appointment" do
  scenario "fills outs the form correctly" do
    provider = FactoryGirl.create(:provider)
    sign_in_provider(provider.uid)
    visit "/appointments/new"

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

    within("#appointment_start_time_5i") do
      select("00")
    end

    within("#appointment_end_time_4i") do
      select("08 PM")
    end

    within("#appointment_end_time_5i") do
      select("00")
    end

    click_button "Add To My Appointments"

    expect(page).to have_content "June 15 2019: 07:00PM - 08:00PM"
    expect(page).to have_content "Appointment Created"
  end
end
