Rails.application.routes.draw do
  get 'credit_card/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_deliver_address'
    post 'deliver_addresses', to: 'users/registrations#create_deliver_address'
  end

  resources :users, only: [:index, :show, :edit] do
    member do
      get 'logout'
    end
    resources :credit_cards, only: [:new, :create, :show, :destroy]
  end

  root "items#index"
  resources :items, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create do
    end
    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
    end
  end
end
