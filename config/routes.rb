Rails.application.routes.draw do
  root to: 'artworks#selected'

  resources :representations, only: [:index]

  resources :artworks, only: %i[index show] do
    collection do
      get 'selected'
      get 'descriptions'
      get 'table'
    end
  end

  resources :exhibitions, only: %i[index show]

  get 'information' => 'pages#information'
  get 'subscribe' => 'pages#subscribe'
  get 'cv' => 'pages#cv'

  get '*path', to: 'errors#not_found', via: :all
end
