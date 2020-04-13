Rails.application.routes.draw do
  root "top#index"
  resources :items, only: [:show] 
end
