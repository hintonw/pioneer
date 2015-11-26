Rails.application.routes.draw do
  
  devise_for :users
  
  root 'trails#index'
  
  resources :trails

  post '/trails/create' => 'trails#create_api'

end
