Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :items, only: [:new, :create, :show]
  resources :registrations
  resources :logins
end

