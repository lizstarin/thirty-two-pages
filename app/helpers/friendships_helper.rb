module FriendshipsHelper

  def friends?(user_one, user_two)
    Friendship.all.each do |friendship|
      return true if friendship.include?(user_one_id) && friendship.include?(user_two_id)
    end
    return false
  end

end