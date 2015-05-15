require 'rails_helper'

module ControllerMacros

	#will define login_user for use in any of our controller specs 
	def login_user
		before (:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.build(:user)
			# user.save!(:validate => false)
			sign_in :user, user
			@current_user = user
		end
	end
	#will set the user session for user id in any of the controller spec tests
	def set_user_session(user)
		session[:user_id] = user.id
	end
end