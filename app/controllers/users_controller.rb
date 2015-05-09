class UsersController < ApplicationController
	# Please note that navigation is on 
	#the layouts/application file

	#

	def index
		render :index
	end

	def show
		render :login
		
	end

	def new
		render :signup

	end

	def speech
		render :speeches
	end
end
