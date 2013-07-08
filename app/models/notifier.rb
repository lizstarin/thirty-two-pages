class Notifier < ActionMailer::Base
  default :from => "liz.starin@gmail.com"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    mail( :to => user.email, :subject => "Thanks for signing up!" )
  end

  def project_share_email(email)
    @link = email.link
    @sender_name = email.sender_name

    mail( :from => email.sender_email, :to => email.recipient_email, :subject => "check out this project on 32 pages!")
  end
end


