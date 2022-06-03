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
  get '/search', to: 'static_pages#search'

  resources :users do
    member do
      get :following, :followers
    end
  end  

  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  
end
