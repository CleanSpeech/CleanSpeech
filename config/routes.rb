Rails.application.routes.draw do
	root to: 'home#index'
	  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
	  resources :users


	  # devise_scope :user do
  	#   	get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	  # end
end
