Rails.application.routes.draw do
  root to: 'artworks#selected'

  resources :artworks, only: %i[index show] do
    collection do
      get 'selected'
      get 'descriptions'
      get 'table'
    end
  end

  resources :exhibitions, only: %i[index show]

  resources :documentation, only: %[index]

  # Static pages
  get 'information' => 'pages#information'
  get 'subscribe' => 'pages#subscribe'
  get 'cv' => 'pages#cv'

  # Redirect old, known routes
  get '/show/:id', to: redirect('/artworks/%{id}')

  # Finally, deal with 404s
  get '*path', to: 'errors#not_found', via: :all
end
