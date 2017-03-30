Rails.application.routes.draw do
   get "/" => "sessions#index"
   post "/sessions/create" => "sessions#create"

   post "/users/create" => "users#create"
end
