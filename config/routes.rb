Rails.application.routes.draw do
root to: 'pages#splash'
get '/signup' => 'users#new'
post 'users' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
resources :users, only: [:new, :create, :show, :destroy]
resources :parties do
  member do
  put 'add_user'
  end
  resources :items
    end
  end
