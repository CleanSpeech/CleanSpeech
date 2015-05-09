Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "users/sessions" }
  
  # devise_scope :user do
  # 	root to: 'devise/registrations#new'
  # end
end
