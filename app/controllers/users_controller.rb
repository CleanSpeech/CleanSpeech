class UsersController < ApplicationController
# controller for users after signing in. Currently controls users/index page.
before_filter :authenticate_user!
 
def index  

end

end
