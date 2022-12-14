Rails.application.routes.draw do
  resources :cards
  resources :decks
  resources :users

  # user authentication and logout routes
  post '/login', to: "sessions#create"
  get '/auth', to: "users#show"
  delete '/logout', to: "sessions#destroy"

  get '/search/:query', to: "cards#search"
  get '/users/search/:language', to: "users#language_partner"

end
