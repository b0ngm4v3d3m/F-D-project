Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/login', to:'sessions#new'
  get '/home', to:'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/contact', to:'static_pages#contact'
  get '/signup', to: 'users#new'
  root  to: 'static_pages#home'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  get '/products', to: 'products#index'

  resources :products
  resources :categories

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  namespace :admin do
    root "dash_board#index"
    resources :dash_board, only: :index
    resources :categories
    resources :products
  end
end
