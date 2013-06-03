class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :bio, :city, :state, :country, :user_id

  belongs_to :user
end