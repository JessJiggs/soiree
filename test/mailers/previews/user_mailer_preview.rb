# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/invite
  def invite
    UserMailer.invite
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reminder
  def reminder
    UserMailer.reminder
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/update
  def update
    UserMailer.update
  end

end
