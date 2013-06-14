class Email < ActiveRecord::Base
  attr_accessible :user_id, :sender_email, :sender_name, :recipient_email, :link

#  validates :sender_email, :recipient_email, :link, :presence => :true
#  validates :sender_email, :recipient_email, :format => { :with => \b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b }
  belongs_to :user
end