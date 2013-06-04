class ApplicationController < ActionController::Base
  protect_from_forgery

  include FriendshipsHelper
  include UsersHelper
end
