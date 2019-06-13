Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/address', to: 'address#index'
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'

  get "/page", to:"page#index"

  namespace :admin do
    resources :stores
  end
end
