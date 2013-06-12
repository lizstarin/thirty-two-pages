class ImagesController < ApplicationController

  def new

  end

  def create
    @project = Project.find(params[:project_id])
    @image = @project.images.build(params[:image])
    @image.save
    render :nothing => true
  end

end