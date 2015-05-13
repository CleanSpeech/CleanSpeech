require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	 include Devise::TestHelpers
	 let(:user) { FactoryGirl.build(:user) }

	 #does the user id establish a session
	 it "should grant user access" do
     	user = FactoryGirl.build(:user)
      	session[:user_id] = user.id
	 end
	 #testing that the users index can be rendered and gives the right http status
	 it "renders the user index" do
	 	get :index
	 	expect(response).to have_http_status(302)
	 end

	 #making sure the user id gets the session when the user logs in
	 # login_user is established in the controller macro
	 describe "get index with user id" do

	 	login_user

	 	it "returns http success" do
	 		user_id = request.session[user_id] 

	 		get :index, id: user[:id]
	 		expect(response).to have_http_status(302)
	 	end	
	end

	it "get #new denies access" do
		get :new, id: nil
		expect(response).to redirect_to root_url
	end

	# describe "signing in with a user" do
		it "allows an existing user to sign in " do
			FactoryGirl.build(:user)

			visits "users/sign_in"

			fill_in "Email", with: FactoryGirl.build(:user)
			fill_in "Password", with: FactoryGirl.build(:user)

			click_button "Sign in"

		end
		
	end













