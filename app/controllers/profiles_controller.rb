class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @user = User.where(:user_id => params[:id])
  end

  def create
    @profile = Profile.build.where(:user_id => params[:id])
    if @profile.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

end