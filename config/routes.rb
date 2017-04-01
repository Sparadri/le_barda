Rails.application.routes.draw do
  devise_for :users
  root to: 'collections#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home',   to: 'pages#home'

  resources :products, only: [:index, :show, :new, :create, :update, :destroy]
  resources :collections, only: [:index]

  resources :collections do
    resources :products, only: [ :show, :create ]
  end

end
