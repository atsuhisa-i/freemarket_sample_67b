Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_deliver_address'
    post 'deliver_addresses', to: 'users/registrations#create_deliver_address'
  end

  root "items#index"
  resources :items, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
  end
  resources :puroducts, onyl: [:index]
  resources :users, only: [:show, :new, :index]
  resources :logout, only: [:show]
  resources :card, only: [:new]
  resources :card_registrations, only: [:new]
  resources :cards, only: [:show]
  resources :mypage, only: [:show]
end
