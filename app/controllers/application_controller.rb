class ApplicationController < ActionController::Base
  protect_from_forgery

  include UserSearchHelper
  include FriendshipsHelper
  include UsersHelper
end
