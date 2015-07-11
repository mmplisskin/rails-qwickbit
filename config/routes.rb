Rails.application.routes.draw do


  root 'static_pages#landing'


  resources :businesses
  resources :categories
  resources :items
  resources :wallets
  resources :rates
  # resources :static_pages

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/search' => 'businesses#search', as: :search_businesses

    # resources :businesses
  post '/'    => 'sessions#create'

  patch '/wallets' => 'wallets#index'
    # get '/wallets/generate'     => 'wallets#generate', as: :generate_key
  post '/wallets/generate'     => 'wallets#generate', as: :generate_key

  get 'static_pages/locations' => 'static_pages#locations', as: :locations
end
