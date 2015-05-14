class SiteController < ApplicationController
# controller for home page.
 
	def index
	end

	def new
	 @user = User.new
	end

	def show
		unless user_signed_in?
	 		redirect_to "/users/sign_in", :alert => 'Please log in.'
		else
			@words = current_user.words
			render :track		

	 	end
	end

end