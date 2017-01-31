Rails.application.routes.draw do
  get "auth/google_oauth2/callback", to: 'sessions#create', as: 'login'

  root "home#show"
  resources :home, only: [:show]
  resources :appointments
  resources :users
  resources :providers
  resources :auth, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
    end
  end
end
