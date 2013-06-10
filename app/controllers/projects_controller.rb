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