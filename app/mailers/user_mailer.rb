class UserMailer < ActionMailer::Base
  default from: 'password@drank.com'

  def forgot_password_email(user)
    @user = user
    @url = "http://drank.com/token/#{user.token}"
    mail(to: user.email, subject: 'Reset Your Drank Password')
  end
end