class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    @notifications.update_all(:read => true)
  end

  def create
  end

  def destroy
  end

end