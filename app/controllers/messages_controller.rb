class MessagesController < ApplicationController

  def index
    @sent_messages = current_user.sent_messages
    @rec_messages = current_user.rec_messages
  end

  def new
    @message = current_user.sent_messages.build
    @users = User.all.map { |user| [user.full_name, user.id] }
  end

  def create
    @message = current_user.sent_messages.build(params[:message])

    if @message.save
      redirect_to user_message_url(current_user)
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:message])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end