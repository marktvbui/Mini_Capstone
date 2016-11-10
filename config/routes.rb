Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/", to:"products#home"

get "/ice", to:"products#ice"

get "/longclaw", to:"products#longclaw"

get "/needle", to:"products#needle"


end
