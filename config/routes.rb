Rails.application.routes.draw do
	root to: 'site#index'

	get "/test" => "test#index"
	get "/track" => "site#show" 
	post "/track" => "words#create"
	patch "/track/:id" => "words#update"
	
	  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
	  resources :users
<<<<<<< HEAD
	  resources :site
=======
>>>>>>> f746f3ae19e310f9e44b11dde037b15e345e22ab
	  resources :words
	  resources :speech_attempts
end
