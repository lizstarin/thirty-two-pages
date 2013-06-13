class ImagesController < ApplicationController

  def new

  end

  def create
    @project = Project.find(params[:project_id])
    @image = @project.images.build(params[:image])
    @image.save
    redirect_to :back
  end

  def update
    @page = Page.find(params[:page_id])
    @page.image.update_attributes(:page_id => nil)    # NB: @image and page.image are different objects

    @image = Image.where(:project_id => @page.project.id, :file_file_name => params[:file_file_name])[0]
    @image.update_attributes(:page_id => params[:page_id])

    @page.update_attributes(:image => @image)
    @page.save
    render :nothing => true
  end

end