class UserSearchesController < ApplicationController

  # def new
  #   @user_search = UserSearch.new
  # end

	def create
    @user_search = UserSearch.new(params[:user_search])
    result = find_user(@user_search.input)
    @user_search.update_attributes(:result => result)
    # @user = User.where(:email => params[:input])
    # username = "#{user.profile.first_name} #{user.profile.last_name}"
    # @user_search.update_attributes(:result => username)
    if @user_search.save
			redirect_to user_url(@user)
		else
			render :nothing
		end
	end


end