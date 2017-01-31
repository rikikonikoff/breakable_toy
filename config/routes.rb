Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get 'auth/failure'

  root to: "home#show"
  resources :home, only: [:show]
  resources :sessions
  resources :users
  resources :providers
  resources :appointments
end
