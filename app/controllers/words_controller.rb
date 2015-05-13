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

	def update
		@user = current_user
		@word = Word.find(params[:id])
		@user.words.delete(@word)

		respond_to do |f|
  			f.html
  			f.json { render json: @word }
  		end
	end

	# def destroy
	# 	# @word = current_user.word.id
	#  #    @word.delete

	#     id = params[:id]
 #        @word = User.word.find_by(id)
 #        @word.delete
 #        redirect_to "/track"
	#     @u = current_user

 #        u.words.delete(Word.find(63))

	#     respond_to do |format|
	#       format.html { redirect_to posts_url, notice: 'Word was successfully destroyed.' }
	#       format.json { head :no_content }
	#     end  
 #  	end

private
    
    def set_word
      @word = Word.find(params[:id])
    end

    
    def post_params
      params.require(:word).permit(:word)
    end

end