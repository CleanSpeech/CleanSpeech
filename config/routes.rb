Rails.application.routes.draw do
devise_for :users

  # devise_scope :user do
  #   root to: 'devise/registrations#new'
  # end

  root to: "users#index"
 
  # REST routes

  get '/users', to: 'users#index'
  get '/users/signup', to: 'users#new'
  get '/users/login', to: 'users#show'
  get '/users/speeches', to: 'users#speech'

end
