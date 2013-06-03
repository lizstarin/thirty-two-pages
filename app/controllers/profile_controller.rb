class ProfileController < ApplicationController

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(params[:profile])
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