Rails.application.routes.draw do
  root "home#show"
  resources :home, only: [:show]
  resources :users, only: [:show]
  resources :providers, only: [:index, :show]
  resources :appointments

  namespace :users do
    resources :auth, only: [:show]
    resources :sessions, only: [:new, :create, :destroy]
  end

  namespace :providers do
    resources :auth, only: [:show]
    resources :sessions, only: [:new, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
    end
  end
end
