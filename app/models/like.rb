class Like < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :project_id

  belongs_to :post
  belongs_to :user
	belongs_to :project

	# Not sure why the validations break Likes
	
	# validates :post_id, :uniqueness => { :scope => :user_id } 
	# validates :project_id, :uniqueness => { :scope => :user_id } 
end