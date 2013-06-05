class ApplicationController < ActionController::Base
  protect_from_forgery

  include FriendshipsHelper
  include UsersHelper

  before_filter :authenticate_user!

end
