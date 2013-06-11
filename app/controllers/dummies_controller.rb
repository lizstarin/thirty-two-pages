# class DummiesController < ApplicationController
#
#   def new
#     @dummy = current_user.build_dummy
#   end
#
#   def create
#     @project = Project.find(params[:project_id])
#     @dummy = @project.build_dummy(params[:dummy])
#
#     if @dummy.save
#       redirect_to user_project_url(@project)
#     else
#       render :new
#     end
#   end
#
#   def show
#     @dummy = Dummy.where(:project_id => params[:project_id])
#   end
#
#
# end