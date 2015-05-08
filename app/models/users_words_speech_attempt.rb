class UsersWordsSpeechAttempt < ActiveRecord::Base
	
	belongs_to :users_word
	belongs_to :speech_attempt

end
