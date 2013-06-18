class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(:content => params[:content], :project_id => params[:project_id])
    @post.save
    render :nothing => true
  end

  def show
    @post = Post.last
  end

end