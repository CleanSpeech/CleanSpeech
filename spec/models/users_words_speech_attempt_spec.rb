require 'rails_helper'

RSpec.describe UsersWordsSpeechAttempt, :type => :model do
  
  	it 'creates new users words speech attempt' do
  		@userswordsspeechattempt = UsersWordsSpeechAttempt.new
  		expect(@userswordsspeechattempt).to be_instance_of UsersWordsSpeechAttempt
  	end
end