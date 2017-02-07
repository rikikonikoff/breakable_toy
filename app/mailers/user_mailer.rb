class UserMailer < ApplicationMailer
  default from: 'accesspointmentalhealth@example.com'

  def cancellation_email(appointment)
    @appointment = appointment
    @user = User.find(@appointment.user_id)
    mail(to: @user.email, subject: 'Your Appointment Was Cancelled By The Provider')
  end
end
