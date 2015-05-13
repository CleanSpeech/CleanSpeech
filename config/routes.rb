Rails.application.routes.draw do
	root to: 'site#index'

	get "/test" => "test#index"
	get "/track" => "word#create"
	post "/track" => "word#create"
	
	  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
	  resources :users
	  resources :home
	  resources :words
	  resources :speech_attempts
end
