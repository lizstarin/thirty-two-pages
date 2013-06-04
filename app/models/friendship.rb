class Friendship < ActiveRecord::Base
  attr_accessible :user_one_id, :user_two_id
end