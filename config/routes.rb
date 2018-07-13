Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  
  # update routes for authors -> some were updated
  resources :authors
  resources :posts
  

  # specific routes to fully support post commenting 
  get '/comments/new/:post_id', to: 'comments#new', as: :new_comment
  post '/comment', to: 'comments#create'

  # for post searching 
  get 'search_posts', to: 'posts#search_posts', as: :search_post

  # get '/authors', to: 'authors#index', as: :authors
  # get '/authors/:id', to: 'authors#show', as: :author
  # get '/author/new', to: 'authors#new', as: :new_author
  
end