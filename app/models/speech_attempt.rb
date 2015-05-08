class SpeechAttempt < ActiveRecord::Base
	belongs_to :user

	has_many :users_words, :through => :users_words_speech_attempts
	has_many :users_words_speech_attempts
end
