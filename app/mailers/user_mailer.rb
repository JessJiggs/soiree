class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite.subject
  #

  def invite
    @invite = "Hi"

    mail to: "verheuljess@gmail.com"
  end

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reminder.subject
  #
  # def reminder
  #   @reminder = "Hi"

  #   mail to: "to@example.org"
  # end

  # # Subject can be set in your I18n file at config/locales/en.yml
  # # with the following lookup:
  # #
  # #   en.user_mailer.update.subject
  # #
  # def update
  #   @update = "Hi"

  #   mail to: "to@example.org"
  # end
end
