require 'rails_helper'

RSpec.describe User, :type => :model do
	
  	it "creates a user" do
  		@user = User.new
  		expect(@user).to be_instance_of User
  	end

#probably the code we will want to use when we get variables assigned in the users.controller.rb
  	it "creates user in db" do

  		user1 = User.create!(email: "mreekers", password: "batman21")
  		expect(User.email).to eq("mreekers")
  		expect(User.password).to eq("batman21")

  	end

end






