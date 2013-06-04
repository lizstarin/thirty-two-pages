module UsersHelper

  def user_friends(user)
    result = []
    Friendship.all.each do |friendship|
      if friendship.include?(user.id)
        friend_id = (friendship.select { |el| el != user.id }).pop
        friend = User.find(friend_id)
        result << friend
      end
    end
    result
  end

end