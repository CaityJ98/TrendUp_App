Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root page is home page
  root to: 'pages#home'
  # take user to restricted page (only if logged in)
  get 'restricted', to: 'pages#restricted'
  # take user ot listings page
  get 'listings', to: 'listings#index', as: 'listings'
  # post listing created by user to listings page
  post "listings", to: "listings#create" 
  # take user to create listing
  get "listings/new", to: "listings#new", as: "new_listing" 
  # take user to specific lisiting
  get 'listings/:id', to: 'listings#show', as: 'listing'
  #update listings
  get "listings/:id", to: "listings#update" 
  # publish and save updated listing
  patch "listings/:id", to: "listings#update"
  # delete listing
  delete "listings/:id", to: "listings#destroy"
  # take user to edit listings. 
  get "listings/:id/edit", to: 'listings#edit', as: "edit_listing"

  
end
