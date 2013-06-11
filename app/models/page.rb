class Page < ActiveRecord::Base
  attr_accessible :number, :project_id

  belongs_to :project
  has_many :captions
end