class LikesController < ApplicationController

  def create
    # @like = current_user.like.build(params[:like])
    @like = current_user.likes.build(:post_id => params[:post_id])

    @like.save
    redirect_to :back
  end

  def destroy
    @like = Like.find(params[:like])

    @like.destroy
    redirect_to :back
  end

end