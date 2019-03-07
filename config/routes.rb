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

  resources :properties, only: [:index, :show, :new]

  resource :user, except: [:show]
  get "/user", to: redirect('/mon_profil')
  get "/mon_profil", to: "users#show"

  resources :properties do
    resources :reservations, only: [:new, :create, :index, :destroy]
  end

  resource :cart, except: [:show]
  get "/cart", :to => redirect('/mon_panier')
  get "/mon_panier", to: "carts#show"


  resources :orders, only: [:show, :new, :create]
  get "/orders", :to => redirect('/mes_commandes')
  get "/mes_commandes", to: "orders#index"


  # get "/users/:id" => "users#show", as: "mon_profil"
  # get "/carts/:id" => "carts#show", as: "mon_panier"
end
