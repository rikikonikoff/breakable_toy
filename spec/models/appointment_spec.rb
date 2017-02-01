require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let!(:appointment) { FactoryGirl.create(:appointment) }

  describe ".new" do
    it "has a provider" do
      expect(appointment.provider).to be_a Provider
    end

    it "has a date" do
      expect(appointment.date).to be_a Date
    end

    it "has a start time" do
      time = appointment.start_time.strftime("%I:%M%p")
      expect(time).to eq "11:00AM"
    end
  end
end
