Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'login'
  get '/auth/google_oauth2?session_type=provider',
    to: 'sessions#create', as: 'login_provider'
  get '/auth/google_oauth2?session_type=user',
    to: 'sessions#create', as: 'login_user'
  patch '/appointments/:id?option=book',
    to: 'appointments#update', as: 'book_appointment'
  patch '/appointments/:id?option=unbook',
    to: 'appointments#update', as: 'unbook_appointment'

  root "home#show"

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
      resources :providers, only: [:index, :show]
    end
  end

  resources :auth, only: [:show]
  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
  resources :resources, only: [:index]
  resources :appointments
  resources :providers
  resources :users , except: [:index] do
    resources :appointments, only: [:index]
  end
  resources :insurers, only: [:create]
  resources :insurance_providers, only: [:create, :destroy]
end
