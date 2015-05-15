require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	 include Devise::TestHelpers
	 let(:user) { FactoryGirl.create(:user) }

	 #does the user id establish a session
	 	it "should grant user access" do
     		user = FactoryGirl.create(:user)
      		session[:user_id] = user.id
      		expect(user).to be_valid
	 	end

	 #testing that the users index can be rendered and gives the right http status
	 	it "renders the user index" do
	 		user = FactoryGirl.create(:user)
      		session[:user_id] = user.id
	 		get :index
	 		expect(response).to have_http_status(302)
	 	end	 

	 #making sure the user id gets the session when the user logs in
	 #login_user is established in the controller macro
	 describe "get index with user id" do
	 	#login user is defined in the controller macros for easier use
	 	login_user
	 	it "returns http success" do
	 		user_id = request.session[user_id] 
	 		get :index, id: user[:id]
	 		expect(response).to have_http_status(302)
	 	end		
	end
end












