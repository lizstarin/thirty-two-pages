class Project < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :public, :thumbnail,
                  :self_ends, :trim_height, :trim_width, :page_count

  belongs_to :user
  has_attached_file :thumbnail, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :pages, :dependent => :destroy
  has_many :images, :dependent => :destroy
	has_many :posts, :dependent => :destroy
	has_many :likes, :dependent => :destroy

  validates :user_id, :title, :presence => true
  validates :public, :inclusion => { :in => [true, false] }
end