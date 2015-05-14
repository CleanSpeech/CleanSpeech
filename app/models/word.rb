class Word < ActiveRecord::Base
	
	has_many :users, :through => :users_words
	has_many :users_words

	has_many :speech_attempts, :through => :users_words_speech_attempts
	has_many :users_words_speech_attempts

	accepts_nested_attributes_for :users_words
	validates_uniqueness_of :word

	
end
