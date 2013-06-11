class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
    @user = User.find(params[:user_id])
  end

  def new
    @project = current_user.projects.build
    @project.build_dummy
  end

  def create
    @project = current_user.projects.build(params[:project])

    @dummy = @project.build_dummy(params[:dummy])
    @dummy.save

    @dummy.page_count.times do |i|
      @caption = @dummy.captions.build(:content => "(page #{i} text)")
      @caption.save
    end

    if @project.save
      redirect_to user_project_url(current_user, @project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @dummy = @project.dummy
  end

  def update
    @project = Project.find(params[:id])
    @dummy = @project.dummy
    @dummy.update_attributes(params[:dummy])

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