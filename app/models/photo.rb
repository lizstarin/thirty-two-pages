class Photo < ActiveRecord::Base
  attr_accessible :user_id, :file, :caption

  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user
end