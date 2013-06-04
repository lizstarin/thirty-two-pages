class FriendRequestsController < ApplicationController

  def index
    @requests_rec = FriendRequest.where(:recipient_id => current_user.id, :status => nil)
    @requests_sent = FriendRequest.where(:sender_id => current_user.id, :status => nil)
  end

  def create
    @friend_request = FriendRequest.new(
            :sender_id => current_user.id,
            :recipient_id => params[:user_id],
            :status => "made"
            )
    if @friend_request.save
      user = User.find(params[:user_id])
      redirect_to user_url(user)
    else
      render :back
    end
  end

  def update
    @friend_request = FriendRequest.where(
            :sender_id => current_user.id
            :recipient_id => params[:user_id]
            :status => "made"
            )
  end

end