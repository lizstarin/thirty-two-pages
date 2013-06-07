class PhotosController < ApplicationController

  def index
    @photos = Photo.where(:user_id => current_user.id)
		@photo = current_user.photos.build
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(params[:photo])

    if @photo.save
      redirect_to user_photos_url(current_user)
    else
      render :new
    end
  end

  def show
    @photo = current_user.photos.find(params[:id])
  end

end