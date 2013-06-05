class FriendshipsController < ApplicationController

  # def new
  #   @friendship = Friendship.new
  # end

  def create
    @friendship = Friendship.new(:user_id => current_user.id, :friend_id => params[:friend_id])
    @friendship.save

    @friendship_recip = Friendship.new(:user_id => params[:friend_id], :friend_id => current_user.id)
    @friendship_recip.save

    redirect_to user_url(current_user)
  end

  def destroy

  end

end