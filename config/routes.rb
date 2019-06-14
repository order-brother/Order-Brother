Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/address', to: 'address#index'
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "/page", to:"page#index"
end
