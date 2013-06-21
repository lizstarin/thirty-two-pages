class EmailsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:new, :create]

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])

    if @email.save
      Notifier.project_share_email(@email.link, @email.recipient_email, @email.sender_email, @email.sender_name).deliver
      redirect_to :back
    else
      render :new
    end
  end

end