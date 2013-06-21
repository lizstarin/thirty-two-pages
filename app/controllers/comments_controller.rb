class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @comment = Comment.new(:content => params[:content],
                           :post_id => params[:post_id],
                           :user_id => current_user.id)
    if @comment.save
      notif = @comment.post.user.notifications.build(
                      :content => "#{current_user.full_name} has commented on your post.",
                      :read => false
                      )
                      notif.save
 #     redirect_to user_url(@comment.post.user)
      # render :create
    end
    render :nothing => true
  end

  def refresh
    @comment = Comment.last
    render :layout => false
  end

  def show
    @comment = Comment.last
  end

end