Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :items, only: [:new, :create, :show]
  resources :registrations
  resources :logins
  resources :puroducts, onyl: [:index]
  resources :users, only: [:show, :new, :index]
  resources :logout, only: [:show]
  resources :card, only: [:new]
  resources :card_registrations, only: [:new]
  resources :cards, only: [:show]
  resources :mypage, only: [:show]
end

