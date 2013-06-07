class PostsController < ApplicationController

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])
    # @post.update_attributes(:user_id => current_user.id)

    if @post.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def show

  end

end