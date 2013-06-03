class UsersController < ApplicationController

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
    @user = User.find(params[:id])
  end


end