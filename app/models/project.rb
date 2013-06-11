class Project < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :public, :thumbnail

  belongs_to :user
  has_attached_file :thumbnail, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_one :dummy

  accepts_nested_attributes_for :dummy
  attr_accessible :dummy_attributes

  validates :user_id, :title, :presence => true
  validates :public, :inclusion => { :in => [true, false] }
end