Rails.application.routes.draw do
  root to: 'representations#index'

  resources :representations, only: [:index]
  resources :artworks, only: [:index, :show]
  resources :index, only: [:index]
  resources :descriptions, only: [:index]

  get 'information' => 'pages#information'
  get 'subscribe' => 'pages#subscribe'
end
