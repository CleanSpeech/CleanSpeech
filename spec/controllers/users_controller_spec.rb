require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	 let(:user) { FactoryGirl.build(:user) }

	 it "should grant user access" do
     	user = FactoryGirl.build(:user)
      	session[:user_id] = user.id
	 end

	 it "renders the user index" do
	 	get :index
	 	expect(response).to have_http_status(302)
	 end

	 describe "get index with user id" do

	 	# login_user

	 	it "returns http success" do
	 		user_id = request.session[user_id] 

	 		get :index, id: user[:id]
	 		expect(response).to have_http_status(302)
	 	end

	 end
end