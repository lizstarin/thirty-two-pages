class Post < ActiveRecord::Base
  attr_accessible :title, :content, :user_id

  belongs_to :user

  validates :title, :content, :user_id, :presence => true
end