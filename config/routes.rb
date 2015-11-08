Rails.application.routes.draw do
root to: 'pages#splash'
get '/signup' => 'users#new'
post 'users' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
resources :users, only: [:new, :create, :show, :destroy, :edit, :update]
resources :parties do
  member do
  put 'add_user'
  end
  resources :items do
    member do
      patch 'claim_item'
      end
    end
  end
end
