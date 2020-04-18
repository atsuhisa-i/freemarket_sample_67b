Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :items, only: [:show] 
  resources :registrations
  resources :logins
end

