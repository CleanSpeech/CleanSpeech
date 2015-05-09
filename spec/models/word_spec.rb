require 'rails_helper'

RSpec.describe Word, :type => :model do
  
	it "creates new word" do
		@word = Word.new
		expect(@word).to be_instance_of Word
	end

end
