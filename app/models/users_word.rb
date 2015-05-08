class UsersWord < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :word

	has_many :speech_attempts, :through => :users_words_speech_attempts
	has_many :users_words_speech_attempts
end
