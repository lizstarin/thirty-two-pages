class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.update_attributes(:user_id => current_user.id)

    if @comment.save
      redirect_to :back
    else
      render :new
    end
  end


end