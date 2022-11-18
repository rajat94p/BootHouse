Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
  
  root'homes#index'
  
    
  
  resources :profiles
    get "profiles/:id/edit" => "profiles#edit"


end
