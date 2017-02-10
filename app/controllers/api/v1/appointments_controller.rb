class Api::V1::AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    appointments = Appointment.all
    @appointments = appointments.sort_by { |a| [a.date, a.start_time] }
    render json: @appointments
  end
end
