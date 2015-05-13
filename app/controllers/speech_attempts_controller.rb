class SpeechAttemptsController < ApplicationController
# controller for home page.
 
	def create
		@speech_attempt = Speech_Attempt.create(params.require(:time).permit(:time))

  		respond_to do |f|
  			f.html
  			f.json { render json: @speech_attempt }
  		end
	end

end