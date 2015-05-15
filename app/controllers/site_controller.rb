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

			@words_array = []

			user = current_user
			@attempts = user.speech_attempts
				#byebug
				@attempts.each do |attempt|
						word_hash = {}
					attempt.words.each do |werd|
				 	theWord = werd.word


				 	foo = UsersWordsSpeechAttempt.where(speech_attempt_id: attempt.id, word_id: werd.id)[0]
					theCount = foo.count
					word_hash[theWord] = theCount
					#byebug
				end
				@words_array << word_hash
			
			end




			render :track		

	 	end
	end

end