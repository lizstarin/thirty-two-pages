class LikesController < ApplicationController

  def create
    # @like = current_user.like.build(params[:like])
    @like = current_user.likes.build(:post_id => params[:post_id])

    if @like.save
      notif = @like.post.user.notifications.build(
                      :content => "#{current_user.full_name} likes your post #{@like.post.title}.",
                      :read => false
                      )
                      notif.save
    end
    redirect_to :back
  end

  def destroy
    @like = Like.find(params[:like])

    @like.destroy
    redirect_to :back
  end

end