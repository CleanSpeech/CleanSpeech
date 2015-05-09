Rails.application.routes.draw do
  devise_for :users
  root to: 'tests#index'
end
