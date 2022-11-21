Rails.application.routes.draw do
  devise_for :users, :controllers  => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
    #get 'cart' to: 'cart#show'
    post 'cart/add'
    post 'cart/remove'

    resources :cart
  root'products#index'
  
  resources :products
  resources :categories    
  
  resources :profiles
    get "profiles/:id/edit" => "profiles#edit"


end
