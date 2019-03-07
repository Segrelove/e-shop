class UserMailer < ApplicationMailer
  default from: 'no-reply@ding-dong.fr'

  def welcome_email(user)
    @user = user
    @url  = 'http://ding-dong-production.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenue chez Ding Dong !')
  end
end
