Rails.application.routes.draw do
  devise_for :users
  root 'page#index'
<<<<<<< HEAD
  get '/address', to: 'address#index'
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'
<<<<<<< HEAD
=======
  get '/address', to: 'address#index' 
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stores, only: [:show]
  resources :transaction, only: [:create ,:show]
>>>>>>> add #25

  namespace :admin do
    resources :stores, shallow: true do
      resources :dishes
      resources :transactions, only: [:index, :new, :create]
    end

    resources :transactions, only: [:show, :edit, :update, :destroy] do
      member do
        patch :state
      end
    end
  end
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stores, only: [:show]

>>>>>>> add frontend stores page
end
