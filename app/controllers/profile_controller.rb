class ProfileController < ApplicationController

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes
      redirect_to profile_url(@profile)
    else
      render :edit
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

end