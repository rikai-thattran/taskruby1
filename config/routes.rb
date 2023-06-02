Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  # get 'static_pages/home'
  # get 'static_pages/help'
  resources :microposts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help', as: :help_ne
  get '/about', to: 'static_pages#about'
  # get '/login/index', to: 'static_pages#indexLogin'
  get '/contact', to: 'static_pages#contact'
  get '/singup', to: 'users#new'
  # root 'application#hello'
  # root 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  root 'static_pages#home'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :microposts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
