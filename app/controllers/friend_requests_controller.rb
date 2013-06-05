class FriendRequestsController < ApplicationController

  def index
    @requests_rec = FriendRequest.where(:recipient_id => current_user.id, :status => "pending")
    @requests_sent = FriendRequest.where(:sender_id => current_user.id, :status => "pending")
  end

  def create
    @friend_request = FriendRequest.new(
            :sender_id => current_user.id,
            :recipient_id => params[:user_id],
            :status => "pending"
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
            :sender_id => params[:user_id],
            :recipient_id => current_user.id,
            :status => "pending"
    # @friend_request = current_user.pending_requests.where(:sender_id => params[:user_id])[0]
    )[0]
		@friend_request.update_attributes(:status => params[:status])
		@friend_request.save
		if @friend_request.status == "accepted"
      make_friendship(params[:user_id])
    else
      redirect_to user_url(current_user)
    end



  end

  def make_friendship(friend_id)
    @friendship = Friendship.new(:user_id => current_user.id, :friend_id => friend_id)
    @friendship.save

    @friendship_recip = Friendship.new(:user_id => friend_id, :friend_id => current_user.id)
    @friendship_recip.save

    redirect_to user_url(current_user)
  end

end