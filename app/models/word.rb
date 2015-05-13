class Word < ActiveRecord::Base
	
	has_many :users, :through => :users_words
	has_many :users_words

	accepts_nested_attributes_for :users_words
	validates_uniqueness_of :word

	
end
