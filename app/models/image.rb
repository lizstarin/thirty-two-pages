class Image < ActiveRecord::Base
  attr_accessible :file, :project_id, :page_id

  belongs_to :project
	belongs_to :page
  has_attached_file :file, 
										:styles => { :medium => "300x300>", :thumb => "100x100>" },
										:default_url => "/images/missing.png"
end