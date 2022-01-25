class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @group = params[:group]
    @url  = 'http://example.com/login'
    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    mail(to: 'lobo.r0018@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
