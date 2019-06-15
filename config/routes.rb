Rails.application.routes.draw do
  devise_for :users
  root 'page#index'
  get '/address', to: 'address#index'
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'

  namespace :admin do
    resources :stores, shallow: true do
      resources :dishes
    end
  end
end
