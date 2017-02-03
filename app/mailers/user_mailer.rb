class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def cancellation_email(appointment)
    @appointment = appointment
    @user = @appointment.user
    mail(to: @user.email, subject: 'Your Appointment Was Cancelled By The Provider')
  end
end
