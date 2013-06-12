class CaptionsController < ApplicationController

	def edit
		@caption = Page.find(params[:page_id]).caption
	end

  def update
    # @caption = Page.find(params[:page_id]).caption
		@caption = Page.find(params[:page_id]).caption
    @caption.update_attributes(:content => params[:content])
		render => :none # user_project_url(@caption.page.project)
  end

end