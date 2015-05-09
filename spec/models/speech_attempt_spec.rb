require 'rails_helper'

RSpec.describe SpeechAttempt, :type => :model do
  
	it 'creates new speech attempt' do
  		@speechattempt = SpeechAttempt.new
  		expect(@speechattempt).to be_instance_of SpeechAttempt
  	end
end
