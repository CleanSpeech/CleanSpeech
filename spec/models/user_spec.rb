RSpec.describe User, :type => :model do

	#testing for new instances of user
    it "creates a user" do
      @user = User.new
      expect(@user).to be_instance_of User
    end

  	#testing for valid login attributes
  	it "is a valid login" do
  	
  		@user = User.create(
  			email: 'email@email.com',
  			password_digest: 'password')
  			
  		expect(@user).to be_valid
  			
  	end

 end



