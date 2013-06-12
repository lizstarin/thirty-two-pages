class CaptionsController < ApplicationController

	def edit
		@caption = Page.find(params[:page_id]).caption
	end

  def update
    # @caption = Page.find(params[:page_id]).caption
		@caption = Page.find(params[:page_id]).caption
    @caption.update_attributes(params[:caption])
	  render :nothing => true
    # redirect_to user_project_url(current_user, @caption.page.project)
  end

end