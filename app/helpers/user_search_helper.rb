module UserSearchHelper

  def find_user(string)
    emails = User.all(:select => :email).map { |el| el.email }
    first_names = Profile.all(:select => :first_name).map { |el| el.first_name }
    last_names = Profile.all(:select => :last_name).map { |el| el.last_name }
    names = first_names.zip(last_names).map { |el| el.join(" ") }
    parsed = string.split("\s")

    if (parsed & emails).size == 1
      email = (parsed & emails)[0]
      return User.where(:email => email)
    elsif names.include(string)
      fname = string.split("\s")[0]
      lname = string.split("\s")[1]
      profile = Profile.where(:first_name => fname) & Profile.where(:last_name => lname)
      return profile
    else
      return "Unable to find user."
    end
  end

end