class Api::V1::AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @appointments = Appointment.all

    if params[:search]
      @appointments = Appointment.search(params[:search])
    end

    render json: @appointments
  end
end
