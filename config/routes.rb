Rails.application.routes.draw do
	root to: 'site#index'

	get "/test" => "test#index"
	get "/track" => "site#show"
	post "/track" => "words#create"
	patch "/track/:id" => "words#update"
	post "/messing" => "speech_attempts#bindUWSA"

	  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
	  resources :users
	  resources :site
	  resources :words
	  resources :speech_attempts
end
