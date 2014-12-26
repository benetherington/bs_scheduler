class UserMailer < ActionMailer::Base
  default from: "noreply@bigspoonchicago.com"

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Activate your BS account"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reset your BS password"
  end
  
end
