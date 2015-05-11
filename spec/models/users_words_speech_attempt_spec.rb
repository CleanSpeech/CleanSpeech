require 'rails_helper'

RSpec.describe UsersWordsSpeechAttempt, :type => :model do
  
  	it 'creates new users words speech attempt' do
  		@userswordsspeechattempt = UsersWordsSpeechAttempt.new
  		expect(@userswordsspeechattempt).to be_instance_of UsersWordsSpeechAttempt
  	end

  	 #testing for valid data entries of word 
  it "is a valid users words speech attempt" do
  	
  	@userswordsspeechattempt = UsersWordsSpeechAttempt.create()
  		# :count == 25)
  			
  		# 25.should_not eq(26)
  	# expect(@userswordsspeechattempt).to eq(25)
  			
  end
end
