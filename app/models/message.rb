class Message < ActiveRecord::Base
  attr_accessible :subject, :content, :sender_id, :recipient_id

  belongs_to :sender, :class_name => "User", :foreign_key => :sender_id
  belongs_to :recipient, :class_name => "User", :foreign_key => :recipient_id

  validates :sender_id, :recipient_id, :presence => true
end