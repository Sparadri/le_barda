Rails.application.routes.draw do
  devise_for :users
  root to: 'collections#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home',   to: 'pages#home'
  get 'collections', to: 'collections#index'
  get 'collection/:id', to: 'collections#show'
  get 'products', to: 'products#index'

end
