Rails.application.routes.draw do
  post "users/create" => "users#create"
  get 'users/index'
  get "users/:id" => "users#show" 
  get "signup" => "users#new"
 

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "/" => "home#top"
  get "about" => "home#about"
end
