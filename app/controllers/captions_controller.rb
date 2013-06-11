class CaptionsController < ApplicationController

  def update
    @caption = Caption.find(params[:id])
    @caption.update_attributes(params[:caption])
  end

end