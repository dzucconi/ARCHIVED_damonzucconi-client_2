Rails.application.routes.draw do
  root to: 'representations#index'

  resources :representations, only: [:index]
  resources :artworks, only: [:index, :show]
end
