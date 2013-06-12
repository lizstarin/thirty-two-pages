class CaptionsController < ApplicationController

	def edit
		@caption = Page.find(params[:page_id]).caption
	end

  def update
		@caption = Page.find(params[:page_id]).caption
    @caption.update_attributes(:content => params[:content])
	  render :nothing => true
  end

end