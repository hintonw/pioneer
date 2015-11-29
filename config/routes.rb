Rails.application.routes.draw do
  
  devise_for :users
  
  root 'trails#index'
  
  resources :trails

  post '/trails/create' => 'trails#create_api'

  get '/trails/user/:id' => 'trails#show_api'

  get '/trails' => 'trails#index_api'

  post '/user/new' => 'users#new_api'

end
