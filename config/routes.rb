Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/login', to:'sessions#new'
  get '/home', to:'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/contact', to:'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  get '/products', to: 'products#index'
  get '/feedback',to: 'feedbacks#index'

  resources :categories
  resources :user_rating_products

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :products, only: [:show,:destroy]
  resources :carts, only: [:show, :destroy]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "static_pages#home"
  resources :feedbacks, only: [:create]

  resources :orders do
    member do
      put :update_status
    end
  end

  namespace :admin do
    root "dash_board#index"
    resources :dash_board, only: :index
    resources :categories
    resources :products
    resources :users
    resources :orders do
      member do
        put :update_status
      end
    end
  end
end
