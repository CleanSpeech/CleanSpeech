Rails.application.routes.draw do
	root to: 'test#index'
	  devise_for :users
	  resources :users
end
