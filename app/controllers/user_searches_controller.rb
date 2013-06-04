class UserSearchesController < ApplicationController
	
	def new
		@user_search = UserSearch.new
	end
	
	def create
		@user_search = UserSearch.new(params[:user_search])
		@user = User.where(:email => params[:input])
		@user_search.result = @user
		if @user_search.save
			redirect_to user_url(@user)
		else
			render :new
		end
	end
	
	
end