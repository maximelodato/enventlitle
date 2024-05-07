Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  # Utilisez le nom d'itinéraire 'participate_event_registration' au lieu de 'participate_event_path'
  post 'events/:id/participate', to: 'registrations#create', as: 'participate_event'

  
  delete 'events/:id', to: 'events#destroy', as: 'event'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :events, only: [:index, :new, :create]
  resources :registrations, only: [:new, :create]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end