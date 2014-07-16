class UserMailer < ActionMailer::Base
  default from: 'password@drank.com'

  def forgot_password_email(user)
    @user = user
    @url = 'http://drank.com/login'
    mail(to: user.email, subject: 'Drank Reset Password')
  end
end