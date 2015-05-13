require 'rails_helper'

module ControllerMacros

	def login_user
		before (:each) do
				
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.build(:user)
			# user.save!(:validate => false)
			sign_in :user, user
			@current_user = user

		end
	end

	def set_user_session(user)
		session[:user_id] = user.id
	end

	def current_user
		if user_session_info
			user_id = user_session_info[0][0]
			User.find(user_id)
		else
			nil
		end
	end

	def user_signed_in?
		!!current_user
	end
end