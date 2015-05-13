class WordsController < ApplicationController
# controller for words
 
	def create
		@word = Word.create(params.require(:word).permit(:word))

		if @word.save
			user_signed_in?
	 		@word.users << current_user
  		end

  		respond_to do |f|
  			f.html
  			f.json { render json: @word }
  		end
	end

	def destroy
	    @word.destroy
	    
	    respond_to do |format|
	      format.html { redirect_to posts_url, notice: 'Word was successfully destroyed.' }
	      format.json { head :no_content }
	    end  
  	end

private
    
    def set_word
      @word = Word.find(params[:id])
    end

    
    def post_params
      params.require(:word).permit(:word)
    end

end