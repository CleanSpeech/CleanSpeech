require 'rails_helper'

RSpec.describe UsersWord, :type => :model do
  
	it 'creates new users word' do
  		@usersword = UsersWord.new
  	end

end
