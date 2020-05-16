Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :items, only: [:new, :create, :show]
  resources :registrations
  resources :logins
  resources :puroducts, onyl: [:index]
  resources :mypage
  resources :logout
  resources :card
  resources :card_registrations
end

