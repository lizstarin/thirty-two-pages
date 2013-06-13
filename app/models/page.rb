class Page < ActiveRecord::Base
  attr_accessible :number, :project_id, :image

  belongs_to :project
  has_one :caption, :dependent => :destroy
	has_one :image
end