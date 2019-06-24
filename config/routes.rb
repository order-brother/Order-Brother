Rails.application.routes.draw do
  devise_for :users
  root 'page#index'
  get '/address', to: 'address#index'
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'

  resources :stores, only: [:show]
  # Frontend transaction pages
  resources :transaction, except: %i[destroy] do
    member do
      patch :modify
      patch :save_draft
      patch :cancel
    end
  end

  # Backend pages
  namespace :admin do
    resources :stores, shallow: true do
      resources :dishes do
        member do
          get :cancel
        end
      end
      resources :transactions, only: %i[index new create]
    end

    resources :transactions, only: %i[show edit update destroy] do
      member do
        # patch :act
        patch :accept
        patch :reject
        patch :pick
        patch :modify
        patch :save_draft
        patch :cancel
      end
    end
  end
end
