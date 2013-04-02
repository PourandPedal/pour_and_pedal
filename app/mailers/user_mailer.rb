class UserMailer < ActionMailer::Base
  default from: "brian@icouch.me"



  def environment_url(user)
    if Rails.env.development?
      @url = "http://0.0.0.0:3000/password_resets/#{user.reset_password_token}/edit"
    else
      @url = "http://pour-and-pedal.herokuapp.com/password_resets/#{user.reset_password_token}/edit"
    end
  end


  def reset_password_email(user)
    @user = user
    @url = "http://pour-and-pedal.herokuapp.com/password_resets/#{user.reset_password_token}/edit"
    # environment_url(@user)
    mail(:to => user.email,
         :subject => "P&P: Your password has been reset")
  end
end
