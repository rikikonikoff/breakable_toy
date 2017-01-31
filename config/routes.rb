Rails.application.routes.draw do
  get "provider/auth/google/callback", to: "provider_sessions#create", as: "provider_login"
  get "user/auth/google/callback", to: "user_sessions#create", as: "user_login"
  get "provider_signin", to: "provider_sessions#new", as: "provider_signin"
  get "user_signin", to: "user_sessions#new", as: "user_signin"

  root "home#show"
  resources :home, only: [:show]
  resources :users, only: [:show]
  resources :providers, only: [:index, :show]
  resources :appointments

  namespace :user do
    resources :auth, only: [:show]
    resources :sessions, only: [:new, :create, :destroy]
  end

  namespace :provider do
    resources :auth, only: [:show]
    resources :sessions, only: [:new, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
    end
  end
end
