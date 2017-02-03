class ProviderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def booking_email(appointment)
    @appointment = appointment
    @provider = @appointment.provider
    @url = appointment_path(@appointment)
    mail(to: @provider.email, subject: 'Someone Booked An Appointment With You')
  end

  def cancellation_email(appointment)
    @appointment = appointment
    @provider = @appointment.provider
    @url = appointment_path(@appointment)
    mail(to: @provider.email, subject: 'Your Appointment Was Cancelled By The Patient')
  end
end
