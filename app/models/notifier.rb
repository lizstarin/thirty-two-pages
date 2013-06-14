class Notifier < ActionMailer::Base
  default :from => "liz.starin@gmail.com"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    mail( :to => user.email,
    :subject => "Thanks for signing up!" )
  end

  def project_share_email(user, url, recipient_email)
    @user = user
    @url = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
    mail( :from => user.email,
          :to => recipient_email,
          :subject => "check out my project on 32 pages!"
          )
  end
end

