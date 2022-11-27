Rails.application.routes.draw do
  devise_for :users, :controllers  => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end

    root'products#index'  
    

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

resources :homes

resources :line_items do
    member do
      get 'add_qunatity'
      get 'reduce_quantity'
      post 'create'
    end
  end

  
    resources :carts

    resources :orderables

  
  resources :products 
  # delete '/products/:id' => 'products#destroy'

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end


  get '/category/:category', to: 'products#index'

  
  resources :profiles
  get "profiles/:id/edit" => "profiles#edit"


end
