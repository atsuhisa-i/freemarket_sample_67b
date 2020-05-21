Rails.application.routes.draw do
  get 'credit_card/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_deliver_address'
    post 'deliver_addresses', to: 'users/registrations#create_deliver_address'
  end

  root "items#index"
  resources :items, only: [:new, :create, :show]
  resources :puroducts, onyl: [:index]

  resources :credit_cards, only: [:new, :create, :show] do
    # collection do
      # get 'show', to: 'credit_cards#show'
      # post 'delete', to: 'credit_cards#delete'
    # end
  end
end

