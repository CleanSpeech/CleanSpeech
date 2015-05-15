RSpec.describe User, :type => :model do
  before :each do
  end

  #creating a new instance of user through factorygirl 
  it "creates a valid instance of the user" do
    user = FactoryGirl.create(:user)
    expect(user).to be_instance_of User
    # it { should_expect(@user).to be_valid }
    #call this in rails console using user = FactoryGirl.create(:user)
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
      user = User.create(:password => nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
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



