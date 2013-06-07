class Post < ActiveRecord::Base
  attr_accessible :title, :content, :user_id

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  accepts_nested_attributes_for :comments, :allow_destroy => true

  validates :content, :user_id, :presence => true
end