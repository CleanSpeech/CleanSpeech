require 'rails_helper'

RSpec.describe SpeechAttempt, :type => :model do
  
	it 'creates new speech attempt' do
  	@speechattempt = SpeechAttempt.new
  	expect(@speechattempt).to be_instance_of SpeechAttempt
  end

  	#testing for valid data entries of speech attempt
  it "is a valid word" do
  	@speechattempt = SpeechAttempt.create(
  		speech_name: 'I am the best')	
  	expect(@speechattempt).to be_valid
  			
  end
  #testing with factory 
  it "creates a valid instance of speech attempts in factory" do
    speechattempt = FactoryGirl.create(:speech_attempt)
    expect(speechattempt).to be_instance_of SpeechAttempt
  end 
end
