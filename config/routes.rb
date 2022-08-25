Rails.application.routes.draw do
  resources :cards
  resources :decks
  resources :users

  # user authentication and logout routes
  post '/login', to: "sessions#create"
  get '/me', to: "users#show"
  delete '/logout', to: "sessions#destroy"

end
