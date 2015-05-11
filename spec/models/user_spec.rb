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

    #testing User email validations 
    it "should require an email" do 
      user = User.create(:email => nil)
      user.valid? 
      expect(user.errors[:email]).not_to include(nil)
    end

    #testing User password validation
    it "should require a password" do
      user = User.create(:password_digest => nil)
      user.valid?
      expect(user.errors[:password_digest]).not_to include(nil)
    end

 end



