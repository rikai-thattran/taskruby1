Rails.application.routes.draw do
  # get 'static_pages/home'
  # get 'static_pages/help'
  resources :microposts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/home', to: "static_pages#home" 
  get '/help', to: "static_pages#help" , as: :help_ne
  get '/about', to: "static_pages#about"
  get '/login/index', to: "static_pages#indexLogin"
  get '/contact', to: "static_pages#contact"
  get '/signup', to: 'users#new'
  # root 'application#hello'
  # root 'users#index'
  root 'static_pages#home'
end
