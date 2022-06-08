Rails.application.routes.draw do


  devise_for :users
  root to:"items#index"
  
  resources :items
  resources :carts
  resources :orders
  resources :users
  resources :cart_items

  post "checkout/create", to: "checkout#create"
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"

     
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
