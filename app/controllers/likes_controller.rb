class LikesController < ApplicationController

  def create
		if params[:project_id] == nil
	    @like = current_user.likes.build(:post_id => params[:post_id])

	    if @like.save
	      notif = @like.post.user.notifications.build(
	                      :content => "#{current_user.full_name} likes your post #{@like.post.title}.",
	                      :read => false
	                      )
	                      notif.save
	    end
	    render :nothing => true
		elsif params[:post_id] == nil

	    @like = current_user.likes.build(:project_id => params[:project_id])

	    if @like.save
	      notif = @like.project.user.notifications.build(
	                      :content => "#{current_user.full_name} likes your project #{@like.project.title}.",
	                      :read => false
	                      )
	                      notif.save
	    end
	    redirect_to :back
  	end
	end

  def destroy
    @like = Like.find(params[:like])

    @like.destroy
    render :nothing => true
  end

  def refresh
    @post = Like.last.post
    render :layout => false
  end

end