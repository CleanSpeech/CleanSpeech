class SpeechAttemptsController < ApplicationController
# controller for home page.
 
	def create
		@speech_attempt = SpeechAttempt.create(params.require(:speech_attempt).permit(:time))

  		respond_to do |f|
  			f.html
  			f.json { render json: @speech_attempt }
  		end
	end

end