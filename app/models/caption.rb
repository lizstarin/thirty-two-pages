class Caption < ActiveRecord::Base
  attr_accessible :content, :page_id

  belongs_to :page
end