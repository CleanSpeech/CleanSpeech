Rails.application.routes.draw do
  root to: "users#index"
 
  # REST routes

  get '/users', to: 'users#index'
  get '/users/signup', to: 'users#new'
  get '/users/login', to: 'users#show'
  get '/users/speeches', to: 'users#speech'

end
