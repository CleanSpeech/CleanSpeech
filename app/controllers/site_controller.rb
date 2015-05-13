class SiteController < ApplicationController
# controller for home page.
 
	def index
	end

	def new
	 @user = User.new
	end

	def show
		
		@words = current_user.words
	 	render :track
	end

end