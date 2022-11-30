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
  

  resources :products do 
    member do
      get ':category_id/1/products', to: 'products#index'
      get ':category_id/2/products', to: 'products#index'
      get ':category_id/3/products', to: 'products#index'
    end
  end

  
  resources :profiles
  get "profiles/:id/edit" => "profiles#edit"

  get 'termscondition' => 'static_pages#termscondition'
  get 'faq' => 'static_pages#faq'
  get 'offers' => 'static_pages#offers'

end
