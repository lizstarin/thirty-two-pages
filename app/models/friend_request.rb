class FriendRequest < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :status

  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :recipient, :class_name => "User", :foreign_key => "recipient_id"

  validates :sender_id, :uniqueness => { :scope => [:recipient_id, :status] }
end