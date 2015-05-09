class UsersController < ApplicationController
	def index

		render :index
	end

	def show
		render :login
	end

	def new
		render :signup
	end
end
