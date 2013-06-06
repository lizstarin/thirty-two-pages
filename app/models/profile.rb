class Profile < ActiveRecord::Base
  attr_accessible :bio, :city, :state, :country, :user_id

  belongs_to :user
end