class Notification < ActiveRecord::Base
  attr_accessible :user_id, :content, :read

  belongs_to :user
end