Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_deliver_address'
    post 'deliver_addresses', to: 'users/registrations#create_deliver_address'
  end

  root "top#index"
  resources :items, only: [:new, :create, :show]
  resources :puroducts, onyl: [:index]
end

