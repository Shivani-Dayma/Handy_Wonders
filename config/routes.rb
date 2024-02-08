Rails.application.routes.draw do
  namespace :customer do
    get '/order_place', :to => 'checkouts#orderplace'
    get '/customer/products', to: 'products#search'
    resources :carts ,:products , :orders, :checkouts
  end
  # get 'categories/index'

  namespace :seller do
    resources :products
    delete '/seller/products/:id', to: "products#destroy"
  end

  namespace :admin do
    resources :main
  end
  
  root to: "main#index"
  
  resources :main, :categories,:admin, :seller,:products
  devise_for :accounts, controllers: {
        sessions: 'accounts/sessions',
        registrations: 'accounts/registrations'
      }


end
