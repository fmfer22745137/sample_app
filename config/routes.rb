Rails.application.routes.draw do
  get 'sessions/new'
  root "static_pages#home"
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end  

  get '/messages/sent', to: 'messages#sent'
  get '/messages/received', to: 'messages#received'
  post '/messages/create', to: 'messages#create'
  
  resources :users
  resources :messages
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  
end
