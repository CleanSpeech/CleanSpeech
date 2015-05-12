class Word < ActiveRecord::Base
	
	has_many :users, :through => :users_words
	has_many :users_words

	
end
