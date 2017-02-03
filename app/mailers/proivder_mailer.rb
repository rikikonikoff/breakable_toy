class ProviderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def booking_email(provider, appointment)
    @provider = provider
    @appointment = appointment
    @url = appointment_path(@appointment)
    mail(to: @provider.email, subject: 'Someone Booked An Appointment With You')
  end

  def cancellation_email(provider, appointment)
    @provider = provider
    @appointment = appointment
    @url  = appointment_path(@appointment)
    mail(to: @provider.email, subject: 'Your Appointment Was Cancelled By The Patient')
  end
end
