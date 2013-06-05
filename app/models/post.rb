class Post < ActiveRecord::Base
  attr_accessible :title, :content, :user_id

  belongs_to :user
  has_many :comments, :dependent => :destroy

  # accepts_nested_attributes_for :comments, :allow_destroy => true

  validates :title, :content, :user_id, :presence => true
end