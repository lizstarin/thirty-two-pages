class Image < ActiveRecord::Base
  attr_accessible :file, :project_id

  belongs_to :project
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end