Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  # devise_scope :user do 
  
  # end

  root "items#index"
  resources :items, only: [:new, :create, :show]
  resources :puroducts, onyl: [:index]
end

