Rails.application.routes.draw do
  get 'ui/index'
  get 'ui/demo'
  get 'ui/homepage'
  get 'ui/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
