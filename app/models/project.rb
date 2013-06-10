class Project < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :public

  belongs_to :user

  validates :user_id, :title, :public, :presence => true
  # validates :public, :inclusion => { :in => [true, false] }
end