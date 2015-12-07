Rails.application.routes.draw do
root to: 'users#new'
get '/signup' => 'users#new'
post 'users' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
resources :users
resources :parties do
  member do
  put 'add_user'
  put 'remove_user'
  end
  resources :items do
    member do
      patch 'claim_item'
      end
    end
  end
end
