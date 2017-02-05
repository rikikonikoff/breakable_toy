require 'rails_helper'

RSpec.feature "user unbooks an appointment" do
  let!(:provider) { FactoryGirl.create(:provider) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:appointment) { FactoryGirl.create(:appointment,
    provider: provider,
    booked?: true,
    user_id: user.id
  ) }

  scenario "user cancels a booking" do
    sign_in_user(user.uid)
    @link = appointment.date.strftime("%a %B %d, %Y").to_s + " @ "
    @link += appointment.start_time.strftime("%I:%M%p").to_s
    click_link @link
    click_button "Cancel Booking"

    expect(page).to have_content "Appointment Cancelled"
    expect(page).to have_button "Book Appointment"
    expect(page).to have_content "Booked: false"
  end

  scenario "user cannot cancel some other user's appointment" do
    user_2 = FactoryGirl.create(:user)
    sign_in_user(user_2.uid)
    @link = appointment.date.strftime("%a %B %d, %Y").to_s + " @ "
    @link += appointment.start_time.strftime("%I:%M%p").to_s
    click_link @link

    expect(page).to have_content "Booked: true"
    expect(page).to_not have_button "Cancel Booking"
  end
end
