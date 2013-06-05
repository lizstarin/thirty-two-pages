class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
  #belongs_to :friend, :class_name => "User"

  def full_name
    name = "#{self.profile.first_name} #{self.profile.last_name}"
    name == "\s" ? "Anonymous" : name
  end

  def pending_requests
    self.rec_requests.where(:status => "pending")
  end

  def likes?(post)
    Like.where(:user_id => self.id, :post_id => post.id).length == 1
  end
end
