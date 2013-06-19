class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # redirect_to "/users/#{@user.id}/profile", :method => :post
      @profile = @user.build_profile(:user_id => params[:user_id])
      @profile.save
      Notifier.signup_email(@user).deliver
      redirect_to new_user_session_url
    else
      render :new
    end
  end

  def show
    if params[:id]
      @user = User.includes(:likes).find(params[:id])
    else
      @user = current_user
    end

    @users = User.all
    @profile = @user.profile
    @post_last = Post.last
    @comment_last = Comment.last
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    # @profile = @user.profile

    if @user.update_attributes(params[:user])
      # @profile.update_attributes()
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

end