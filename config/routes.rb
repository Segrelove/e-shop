Rails.application.routes.draw do
  get 'ui/index'
  get 'ui/demo'
  get 'ui/homepage'
  get 'ui/show'
  get 'ui/order'
  get 'ui/cart'
  get 'ui/profile'


  root 'properties#index'

  devise_for :users
  resources :properties, only: [:index, :show]
  resources :users, except: [:show]
  resources :properties do
    resources :reservations, only: [:new, :create, :index, :destroy]
  end
  resources :carts, only: [:show]
  resources :orders, only: [:show, :new, :create]

  get "/users/:id" => "users#show", as: "mon_profil"
  # get "/carts/:id" => "carts#show", as: "mon_panier"
  get "/orders" => "orders#index", as: "mes_commandes"

end
