class Notifier < ActionMailer::Base
  default :from => "liz.starin@gmail.com"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    mail( :to => user.email, :subject => "Thanks for signing up!" )
  end

  def project_share_email(link, recipient_email, sender_email, sender_name)
    @link = link
    @sender_name = sender_name

    mail( :from => sender_email, :to => recipient_email, :subject => "check out this project on 32 pages!")
  end
end


