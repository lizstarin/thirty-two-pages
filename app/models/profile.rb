class Profile < ActiveRecord::Base
  # Paperclip stff
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  attr_accessible :first_name, :last_name, :bio, :city, :state, :country, :user_id

  belongs_to :user
end