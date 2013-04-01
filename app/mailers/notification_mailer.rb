class NotificationMailer < ActionMailer::Base
  default from: "do-not-reply@pourandpedal.com"

  def booking_notification(trip)
    @trip = trip
    @url = 'http://pour-and-pedal.herokuapp.com/admin'
    mail(to: "pour@icouch.me", subject: "P&P New Booking")
  end

  def booking_confirmation(trip, user)
    @user = user
    @trip = trip
    mail(to: @user.email, subject: "pour & pedal booking confirmed!")
  end

  def new_contact(contact)
    @contact = contact
    mail(to: 'pour@icouch.me', subject: "New P&P Customer Message")
  end

  def new_review(review)
    @review = review
    @url = 'http://pour-and-pedal.herokuapp.com/admin'
    mail(to: 'pour@icouch.me', subject: "New P&P Review Submitted")
  end
end
