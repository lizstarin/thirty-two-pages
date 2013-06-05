class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build #(:user_id => current_user.id)
    # @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment], :user_id => current_user.id)
    @comment.update_attributes(:user_id => current_user.id)

    if @comment.save
      redirect_to user_url(@comment.post.user)
    else
      render :new
    end
  end


end