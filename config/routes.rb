Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :games, only: [:index, :show, :create]
      resources :odds, only: [:index, :show, :create]
      resources :tickets, only: [:index, :show, :create, :update, :destroy]
      resources :bets, only: [:index, :show, :create, :update, :destroy]

      get "/users/:id/tickets", to: "users#tickets"
      get "/users/:id/tickets/:ticket_id/bets", to: "users#bets"

      get "tickets/:id/bets", to: "tickets#bets"

      get "games/:id/odds", to: "games#odds"
      get "games/:id/bets", to: "games#bets"

      post '/login', to: 'auth#create'
    end
  end
end
