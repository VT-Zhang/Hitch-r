Rails.application.routes.draw do
   get "/" => "sessions#index"
   post "/sessions/create" => "sessions#create"
   delete "/sessions/destroy" => "sessions#destroy"

   get "/users/profile/:id" => "users#show"
   post "/users/create" => "users#create"

   post "/cars/create" => "cars#create"

   post "/trips/create" => "trips#create"
end
