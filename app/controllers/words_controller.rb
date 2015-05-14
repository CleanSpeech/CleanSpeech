class WordsController < ApplicationController
# controller for words
 
    def new

        @word = Word.new

    end


	def create
		@word = Word.create(params.require(:word).permit(:word))

  		respond_to do |f|
  			f.html
  			f.json { render json: @word }
  		end
	end

end