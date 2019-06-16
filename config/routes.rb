Rails.application.routes.draw do
  devise_for :users
  root 'page#index'
  get '/address', to: 'address#index'
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'

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
end
