Rails.application.routes.draw do
  get "/auth/:provider/callback", to: 'sessions#create'

  root "home#show"
  resources :home, only: [:show]
  resources :appointments

  resources :users, only: [:show] do
    resources :auth, only: [:show]
    resources :sessions, only: [:new, :create, :destroy]
  end
  
  resources :providers, only: [:index, :show] do
    resources :auth, only: [:show]
    resources :sessions, only: [:new, :create, :destroy]
  end

  # namespace :user do
  #   resources :auth, only: [:show]
  #   resources :sessions, only: [:new, :create, :destroy]
  # end
  #
  # namespace :provider do
  #   resources :auth, only: [:show]
  #   resources :sessions, only: [:new, :create, :destroy]
  # end

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
    end
  end
end
