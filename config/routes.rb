Rails.application.routes.draw do
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

  root 'static_pages#landing'


  resources :businesses
  resources :categories


  resources :items
  resources :wallets
  resources :rates


  resources :businesses, :id => { :format => 'json' } do
   resources :items, :item_id => { :format => 'json' }
 end

 resources :categories, :id => { :format => 'json' } do
  resources :businesses, :business_id => { :format => 'json' }
end

  # resources :static_pages

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/search' => 'businesses#search', as: :search_businesses

    # resources :businesses
  post '/'    => 'sessions#create'

  # post 'static_pages/locations' => 'sessions#create'



  patch '/wallets' => 'wallets#index'
    # get '/wallets/generate'     => 'wallets#generate', as: :generate_key
  post '/wallets/generate'     => 'wallets#generate', as: :generate_key

  get 'static_pages/locations' => 'static_pages#locations', as: :locations
end
