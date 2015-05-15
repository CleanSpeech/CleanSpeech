class UsersWordsSpeechAttempt < ActiveRecord::Base
	
	belongs_to :word
	belongs_to :speech_attempt

end
