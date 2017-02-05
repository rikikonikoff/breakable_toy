require 'rails_helper'

RSpec.feature "user books an appointment" do
  before do
    User.destroy_all
    Appointment.destroy_all
    Provider.destroy_all
  end

  let!(:provider) { FactoryGirl.create(:provider) }
  let!(:appointment) { FactoryGirl.create(:appointment, provider: provider, booked?: false) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user books appointment successfully" do
    visit root_path
    sign_in_user(user.uid)
    @link = appointment.date.strftime("%a %B %d, %Y").to_s + " @ "
    @link += appointment.start_time.strftime("%I:%M%p").to_s
    click_link @link
    click_button "Book Appointment"

    expect(page).to have_content "Appointment Booked!"
    expect(page).to have_content "Booked: true"
    expect(page).to have_button "Cancel Booking"
  end

  scenario "user cannot book another user's claimed appointment" do
    user_2 = FactoryGirl.create(:user)
    sign_in_user(user.uid)
    @link = appointment.date.strftime("%a %B %d, %Y").to_s + " @ "
    @link += appointment.start_time.strftime("%I:%M%p").to_s
    click_link @link
    click_button "Book Appointment"
    click_link "Sign Out"

    sign_in_user(user_2.uid)
    @link = appointment.date.strftime("%a %B %d, %Y").to_s + " @ "
    @link += appointment.start_time.strftime("%I:%M%p").to_s
    click_link @link

    expect(page).to have_content "Booked: true"
    expect(page).to_not have_button "Book Appointment"
  end
end
