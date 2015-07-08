Rails.application.routes.draw do


  root 'static_pages#landing'
  get 'static_pages/contact'

  resources :businesses
  resources :categories
  resources :items
  resources :wallets

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
    # resources :businesses

  patch '/wallets' => 'wallets#index'
    # get '/wallets/generate'     => 'wallets#generate', as: :generate_key
  post '/wallets/generate'     => 'wallets#generate', as: :generate_key

end
