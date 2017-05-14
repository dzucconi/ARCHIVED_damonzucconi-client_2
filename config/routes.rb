Rails.application.routes.draw do
  root to: 'representations#index'

  resources :representations, only: [:index]

  resources :artworks, only: %i[index show]
  resources :exhibitions, only: %i[index show]

  resources :index, only: [:index]
  resources :descriptions, only: [:index]

  get 'information' => 'pages#information'
  get 'subscribe' => 'pages#subscribe'

  get '*path', to: 'errors#not_found', via: :all
end
