Rails.application.routes.draw do



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
  post '/static_pages/locations' => 'sessions#create'
  post '/static_pages/locations' => 'businesses#create'
  post '/businesses/:id' => 'sessions#create'
  post '/businesses/:id' => 'businesses#create'

  post '/businesses/:id' => 'items#create'
  patch '/businesses/:id' => 'items#update'

  patch '/wallets' => 'wallets#index'
    # get '/wallets/generate'     => 'wallets#generate', as: :generate_key
  post '/wallets/generate'     => 'wallets#generate', as: :generate_key

  get 'static_pages/locations' => 'static_pages#locations', as: :locations

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all


end
