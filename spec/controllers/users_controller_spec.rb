require 'rails_helper'

describe UsersController do
	 describe 'user access' do
	   before :each do
     	@user = create(:user)
      	session[:user_id] = @user.id
       end





	 end

end