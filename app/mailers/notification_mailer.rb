class NotificationMailer < ActionMailer::Base
  default from: "do-not-reply@pourandpedal.com"

  def booking_notification(event)
    @event = event
    @url = 'http://pour-and-pedal.herokuapp.com/admin'
    mail(to: "pour@icouch.me", subject: "New Booking")
  end

  def booking_confirmation(event, user)
    @user = user
    @event = event
    mail(to: @user.email, subject: "pour & pedal booking confirmed!")
  end
end
