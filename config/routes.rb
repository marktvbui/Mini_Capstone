Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get "/products", to:"products#index"

get "/products/new", to:"products#new"
post "/products", to:"products#create"

get "/products/armor", to: "products#armor"
get "/products/fanfare", to: "products#fanfare"
get "/products/weapon", to: "products#weapon"

get "/products/:id/edit", to:"products#edit"
patch "/products/:id", to:"products#update"

get "/products/:id", to: "products#show"

get "/contact", to: "products#contact"

delete "/products/:id", to:"products#destroy"

get "/products/supplier", to:"products#supplier"

post "/search", to: "products#search"

get "/products/:id/image/new", to:"images#new"
post "/products/:id/image", to:"images#create"

get "/signup", to: "users#new"
post "/users", to: "users#create"

get "login", to: "sessions#new"
post "login", to: "sessions#create"
get "logout", to: "sessions#destroy"




end

