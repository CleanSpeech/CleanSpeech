class SiteController < ApplicationController
# controller for home page.
 
	def index
	end

	def new
	 @user = User.new
	end

	def show
		unless user_signed_in?
	 		redirect_to "/users/sign_in", :alert => 'Please log in.'
		else
			@words = current_user.words
			@user_words_speech_attempts = UsersWordsSpeechAttempt.all
			@user = current_user
			@speech_attempts = SpeechAttempt.all	
			@attempts = @user.speech_attempts

			# @attwrds = @attempts.words
			# @count = @attwrds.count
			render :track		
	 	end
	end



end