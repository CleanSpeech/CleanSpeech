class SpeechAttemptsController < ApplicationController
# controller for home page.
 
	def create

		@speech_attempt = SpeechAttempt.create(params.require(:speech_attempt).permit(:time))
		@speech_attempt.user = current_user
  		respond_to do |f|
  			f.html
  			f.json { render json: @speech_attempt }
  		end
	end

	def bindUWSA
		@user = current_user
		@words = @user.words
		@speech_attempt = SpeechAttempt.create(params.require(:speech_attempt).permit(:time))
		@speech_attempt.user = @user
		@word_hash = params[:wordHash]
	#	byebug
		@word_hash.each do |word, count|
			werd = UsersWordsSpeechAttempt.create
			werd.speech_attempt = @speech_attempt
			the_word = Word.find_by(word: word)
			werd.word = the_word
			werd.count = count.to_i
			werd.save
			@speech_attempt.words << the_word
		end

@speech_attempt.save
		render json: {it: "WORKED"}
	end
end