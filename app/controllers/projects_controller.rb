class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
    @user = User.find(params[:user_id])
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(params[:project])

    @project.page_count.times do |i|
      page = @project.pages.build(:number => i + 1)
      page.save
      caption = page.build_caption(:content => "(page #{i + 1} text)")
      caption.save
      image = page.build_image(:file => nil)
      image.save
    end

    if @project.save
      redirect_to user_project_url(current_user, @project)
    else
      render :new
    end
  end

  def show
    @project = Project.includes(:pages => [:caption, :image]).find(params[:id])
    @image = @project.images.build
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to user_project_url(current_user, @project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])


  end

end