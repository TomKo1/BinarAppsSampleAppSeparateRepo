Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  resources :authors
  resources :posts
  

  # specific routes to fully support post commenting 
  get '/comments/new/:post_id', to: 'comments#new', as: :new_comment
  post '/comment', to: 'comments#create'

  # get '/authors', to: 'authors#index', as: :authors
  # get '/authors/:id', to: 'authors#show', as: :author
  # get '/author/new', to: 'authors#new', as: :new_author
end