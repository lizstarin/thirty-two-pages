class User < ActiveRecord::Base
  # Paperclip stff
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :bitty => "50x50#" }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                         :first_name, :last_name

  has_one :profile
  has_many :sent_requests, :class_name => "FriendRequest", :foreign_key => "sender_id"
  has_many :rec_requests, :class_name => "FriendRequest", :foreign_key => "recipient_id"
  has_many :friends, :through => :friendships, :class_name => "User"
  has_many :friendships
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :rec_messages, :class_name => "Message", :foreign_key => "recipient_id"
  has_many :notifications
	has_many :photos
  has_many :projects
  has_many :emails
  #belongs_to :friend, :class_name => "User"
  accepts_nested_attributes_for :profile
  attr_accessible :profile_attributes

  def full_name
    name = "#{self.first_name} #{self.last_name}"
    name == "\s" ? "Anonymous" : name
  end

  def pending_requests
    self.rec_requests.where(:status => "pending")
  end

  def likes_post?(post)
    Like.where(:user_id => self.id, :post_id => post.id).length == 1
  end

  def likes_project?(project)
    Like.where(:user_id => self.id, :project_id => project.id).length == 1
  end

  def unread_messages
    Message.where(:recipient_id => self.id, :read => false)
  end

  def unread_notifications
    Notification.where(:user_id => self.id, :read => false)
  end
end
