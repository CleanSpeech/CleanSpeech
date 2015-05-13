class SiteController < ApplicationController
# controller for home page.
 
	def index
		@users = User.all
	end

	def new
	 @user = User.new
	end


	def show
	 	render :track
	end

end