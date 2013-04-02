# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external
Rails.application.config.sorcery.submodules = [:core, :reset_password]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|


  # --- user config ---
  config.user_config do |user|
    # -- core --

    user.username_attribute_names = :email
    user.downcase_username_before_authenticating = true

    # mailer class. Needed.
    # Default: `nil`
    #
    user.reset_password_mailer = UserMailer


    # reset password email method on your mailer class.
    # Default: `:reset_password_email`
    #
    user.reset_password_email_method_name = :reset_password_email

    # how many seconds before the reset request expires. nil for never expires.
    # Default: `nil`
    #
    # user.reset_password_expiration_period = 15*60


    # hammering protection, how long to wait before allowing another email to be sent.
    # Default: `5 * 60`
    #
    user.reset_password_time_between_emails = 0
  end
  config.user_class = "User"
  # ActionController::Base.send(:include, Sorcery::Controller)
end
