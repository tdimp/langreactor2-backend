Rails.application.routes.draw do
  resources :cards
  resources :decks
  resources :users

  # user authentication and logout routes
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
