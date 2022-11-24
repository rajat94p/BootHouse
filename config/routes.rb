Rails.application.routes.draw do
  devise_for :users, :controllers  => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end

    root'products#index'  
    

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  resources :line_items
  # post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  # post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  # post 'line_items' => 'line_items#create'
  # get 'line_items/:id' => 'line_items#show', as: 'line_item'
  # delete 'line_items/:id' => 'line_items#destroy'

    resources :carts

  
  resources :products 
  # delete '/products/:id' => 'products#destroy'

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end


  get '/category/:category', to: 'products#index'

  
  resources :profiles
  get "profiles/:id/edit" => "profiles#edit"


end
