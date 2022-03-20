Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root page is home page
  root to: 'pages#home'
  get 'restricted', to: 'pages#restricted'
  get 'listings', to: 'listings#index', as: 'listings'
  post "listings", to: "listings#create" 
  get "listings/new", to: "listings#new", as: "new_listing" 
  get 'listings/:id', to: 'listings#show', as: 'listing'
  get "listings/:id", to: "listings#update" 
  patch "listings/:id", to: "listings#update"
  delete "listings/:id", to: "listings#destroy"
  get "listings/:id/edit", to: 'listings#edit', as: "edit_listing"
  get "payments/success/:id", to: 'payments#success', as: "payment"
  post "payments/webhook", to: "payments#webhook"
  post "payments", to: "payments#create_checkout_session", as: "create_checkout_session"

  
end
