require 'rails_helper'

RSpec.feature "provider cancels an appointment" do
  scenario "deletes an appointment" do
    provider = FactoryGirl.create(:provider)
    appointment = FactoryGirl.create(:appointment, provider: provider)
    sign_in_provider(provider.uid)
    @link = appointment.date.strftime("%a, %B %d %Y").to_s + ": "
    @link += appointment.start_time.strftime("%I:%M%p").to_s + " - "
    @link += appointment.end_time.strftime("%I:%M%p").to_s
    click_link @link
    click_link "Remove this Appointment"

    expect(page).to have_content "Appointment Removed"
    expect(page).to_not have_content @link
  end
end
