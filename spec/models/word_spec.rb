require 'rails_helper'

RSpec.describe Word, :type => :model do
  
  #testing for new instances of word
	it "creates new word" do
		@word = Word.new
		expect(@word).to be_instance_of Word
	end

  #testing for valid data entries of word 
  it "is a valid word" do
  	
  	@word = Word.create(
  		word: 'wordwordword')
  			
  	expect(@word).to be_valid
  			
  end
  	
end