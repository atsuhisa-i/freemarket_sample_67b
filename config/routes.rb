Rails.application.routes.draw do
  root "top#index"
  resources :items, only: [:show] 
  resources :puroducts, onyl: [:index]
end
