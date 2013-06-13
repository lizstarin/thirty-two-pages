class ImagesController < ApplicationController

  def new

  end

  def create
    @project = Project.find(params[:project_id])
    @image = @project.images.build(params[:image])
    @image.save
    redirect_to :back
  end

end