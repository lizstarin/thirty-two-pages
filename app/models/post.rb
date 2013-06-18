class Post < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :project_id

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
	belongs_to :project

  accepts_nested_attributes_for :comments, :allow_destroy => true

  # validates :content, :user_id, :presence => true
end