class UserSearchesController < ApplicationController
	
	def new
		@user_search = UserSearch.new
	end
	
	def create
		@user_search = UserSearch.new(params[:user_search])
		if @user_search.save
			redirect_to user_search_url(@user_search)
		else
			render :new
		end
	end
	
	def show
		@user_search = UserSearch.find(params[:id])
	end
	
end