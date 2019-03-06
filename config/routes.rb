Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'carts/show'
  get 'ui/index'
  get 'ui/demo'
  get 'ui/homepage'
  get 'ui/show'
  get 'ui/order'
  get 'ui/cart'
  get 'ui/profile'

  devise_for :users
  resources :properties, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :properties do 
  	resources :reservations, only: [:new, :create, :index, :destroy]
  end
  root 'properties#index'
  resources :carts, only: [:show]
  resources :orders, only: [:index, :show, :new, :create]
end
