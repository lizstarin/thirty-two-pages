class UsersController < ApplicationController

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
      redirect_to new_user_session_url
    else
      render :new
    end
  end

  def show
     if params[:id]
      @user = User.find(params[:id])
     else
      @user = current_user
     end

    @users = User.all
    @profile = @user.profile
  end


end