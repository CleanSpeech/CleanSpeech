RSpec.describe User, :type => :model do

  #creating a new instance of user through factorygirl 
  it "has a valid factory" do

    @user = FactoryGirl.create(:user)

    expect(@user).to be_valid

    #call this in rails console using user = FactoryGirl.create(:user)

  end

	#testing for new instances of user - code that was used pre-factory_girl
    # it "creates a user" do
    #   @user = User.new
    #   expect(@user).to be_instance_of User
    # end

  	#testing for valid login attributes
  	it "is a valid login" do
  	
  		@user = User.create(
  			email: 'email@email.com',
  			password_digest: 'password')
  			
  		expect(@user).to be_valid
  			
  	end
  describe "validations" do
    #testing User email validations 
    it "should require an email" do 
      user = User.create(:email => nil)
      user.valid? 
      expect(user.errors[:email]).to include("can't be blank")
    end

    #testing User password validation
    it "should require a password" do
      user = User.create(:password_digest => nil)
      user.valid?
      expect(user.errors[:password_digest]).to include("can't be blank")
    end

    #checking to make sure duplicate emails cannot be used
    it "is invalid with a duplicate email" do 
      User.create(
        email: 'test@email.com'
      )
      user = User.new(
        email: 'test@email.com'
      )
      user.valid?
      expect(user.save).to be(false)
    end
  end
 end



