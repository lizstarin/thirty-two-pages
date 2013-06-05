class Like < ActiveRecord::Base
  attr_accessible :post_id, :user_id

  belongs_to :post
  belongs_to :user

  validates :post_id, :uniqueness => { :scope => :user_id }
end