Rails.application.routes.draw do
   get "/" => "sessions#index"
   post "/sessions/create" => "sessions#create"
   delete "/sessions/destroy" => "sessions#destroy"

   get "/users/profile/:id" => "users#show"
   post "/users/create" => "users#create"
   post "/users/update/:id" => "users#update"

   get "/cars/view/:id" => "cars#show"
   post "/cars/create" => "cars#create"
   patch "/cars/:id/update" => "cars#update"

   get "/trips/view/:id" => "trips#show"
   post "/trips/create/" => "trips#create"
   patch "trips/:id/update" => "trips#update"
end
