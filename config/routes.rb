Rails.application.routes.draw do
	root to: 'home#index'

	get "/test" => "test#index"
	
	  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
	  resources :users
	  resources :site
	  resources :words
	  resources :speech_attempts
end
