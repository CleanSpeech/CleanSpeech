require 'rails_helper'

RSpec.describe UsersWord, :type => :model do
  
	  it 'creates new users word' do
  		@usersword = UsersWord.new
  		expect(@usersword).to be_instance_of UsersWord
  	end

  	#testing for valid data entries of UsersWord 
  	it "is a valid users word" do
      @user = FactoryGirl.create(:user)
      @word = FactoryGirl.create(:word)
      
      @user.words << @word
    end
end
