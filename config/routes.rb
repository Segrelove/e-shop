Rails.application.routes.draw do
  get 'ui/index'
  get 'ui/demo'
  get 'ui/homepage'
  get 'ui/cart'

  devise_for :users
  resources :properties, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :properties do resources :reservations, only: [:new, :create, :index]
  end
  root 'properties#index'
end
