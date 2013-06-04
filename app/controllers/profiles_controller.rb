class ProfilesController < ApplicationController

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      redirect_to user_profile_path(@profile)
    else
      render :edit
    end
  end

  def show
    @profile = current_user.profile
		redirect_to user_url(current_user)
  end

end