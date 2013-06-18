class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.update_attributes(:user_id => current_user.id)

    if @comment.save
      notif = @post.user.notifications.build(
                      :content => "#{current_user.full_name} has commented on your post #{@post.title}.",
                      :read => false
                      )
                      notif.save
      redirect_to user_url(@comment.post.user)
    else
      render :new
    end
  end


end