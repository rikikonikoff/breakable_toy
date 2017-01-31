Rails.application.routes.draw do
  get "auth/google_oauth2/callback", to: 'sessions#create', as: 'login'
  get '/auth/google_oauth2?session_type=provider', to: 'sessions#create', as: 'login_provider'
  get '/auth/google_oauth2?session_type=user', to: 'sessions#create', as: 'login_user'

  root "home#show"
  resources :home, only: [:show]
  resources :appointments
  resources :users
  resources :providers
  resources :auth, only: [:show]
  resources :sessions, only: [:create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
    end
  end
end
