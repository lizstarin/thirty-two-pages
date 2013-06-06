class MessagesController < ApplicationController

  def index
    @sent_messages = current_user.sent_messages
    @rec_messages = current_user.rec_messages
  end

  def new
    @message = current_user.sent_messages.build
    @users = current_user.friends.map { |user| [user.full_name, user.id] }
  end

  def create
    @message = current_user.sent_messages.build(params[:message])
    @message.read = false

    if @message.save
      notif = @message.recipient.notifications.build(
                          :content => "#{@message.sender.full_name} has sent you a message.",
                          :read => false
                          )
                          notif.save
      redirect_to user_message_url(@message.sender, @message)
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
    @message.read = true if @message.recipient_id == current_user.id
    @message.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

end