require 'rails_helper'

RSpec.feature "provider edits an existing appointment" do
  scenario "edits an appointment" do
    provider = FactoryGirl.create(:provider)
    appointment = FactoryGirl.create(:appointment, provider: provider)
    sign_in_provider(provider.uid)
    @link = "#{appointment.date.strftime("%a, %B %d %Y")}:"
    @link += " #{appointment.start_time.strftime("%I:%M%p")} - "
    @link += "#{appointment.end_time.strftime("%I:%M%p")}"
    click_link @link
    click_link "Remove this Appointment"

    expect(page).to have_content "Appointment Removed"
    expect(page).to_not have_content @link
  end
end
