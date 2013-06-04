class ChangeFriendshipIds < ActiveRecord::Migration
  def change
    add_column :friendships, :friend_id, :integer
    add_column :friendships, :user_id, :integer
    remove_column :friendships, :user_one_id
    remove_column :friendships, :user_two_id
  end
end
