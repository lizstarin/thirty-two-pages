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
      notif = @friend_request.recipient.notifications.build(
                      :content => "#{current_user.full_name} has sent you a friend request.",
                      :read => false
                      )
                      notif.save
      redirect_to user_url(current_user)
    else
      render :back
    end
  end

  def update
    @friend_request = FriendRequest.where(
            :sender_id => params[:user_id],
            :recipient_id => current_user.id,
            :status => "pending"
    )[0]
		@friend_request.update_attributes(:status => params[:status])
		@friend_request.save
		if @friend_request.status == "accepted"
      notif = @friend_request.sender.notifications.build(
                                :content => "#{current_user.full_name} has accepted your friend request!",
                                :read => false
                                )
                                notif.save
      make_friendship(params[:user_id])
    end
    render :nothing => true
  end

  def make_friendship(friend_id)
    @friendship = Friendship.new(:user_id => current_user.id, :friend_id => friend_id)
    @friendship.save

    @friendship_recip = Friendship.new(:user_id => friend_id, :friend_id => current_user.id)
    @friendship_recip.save
  end

end