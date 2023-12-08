# frozen_string_literal: true

Rails.application.routes.draw do
  get 'quizzes/new'
  get 'quizzes/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:'home#show'
  get 'home', to: 'home#show', as: 'home'
  get 'home/gallery', to: 'birdhouse#gallery', as: 'gallery'
  resources :birdhouse do
    member do
      put :upvote
      get :listings_show
    end
  end 
  resources :birdhouses
  get 'home/guide', to: 'home#guide', as: 'guide'
  get 'home/guide/community', to: 'home#community', as: 'community'
  get 'home/listings', to: 'birdhouse#listings', as: 'listings'
  get 'home/listings/:id', to: 'birdhouse#listings_show', as: 'listings_show'
  post 'home/listings/:id/add_to_cart', to: 'cart#add', as: 'add_to_cart'
  get 'home/cart', to: 'cart#cart', as: 'cart'
  get 'home/cart/:id', to: 'cart#buy', as: 'buy_now'
  delete 'home/cart/:id', to: 'cart#remove_item'

  get 'home/aboutus', to: 'home#aboutus', as: 'aboutus'
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

  get 'home/guide/quiz', to: 'quizzes#new', as: 'new_quiz'
  post 'home/guide/quiz', to: 'quizzes#create', as: 'create_quiz'
  get 'profile/edit', to: 'users#edit', as: 'edit_user_profile'
  patch 'profile', to: 'users#update', as: 'user_profile'

  get 'history', to: 'users#history', as: 'history'

  get '/inventory', to: 'birdhouse#inventory', as: 'inventory'

  get '/inventory/:id/edit', to: 'inventory#edit', as: 'edit_inventory'
  patch '/inventory/:id', to: 'inventory#update', as: 'update_inventory'
  delete '/listings/:id', to: 'birdhouse#destroy', as: 'delete_listing'
 

  resources :questions, only: [:create, :show] do
    resources :answers, only: [:create]
  end

  resources :orders#, only: [:new, :create, :show]

  get 'checkout', to: 'orders#checkout'
  post 'checkout', to: 'orders#create', as: 'create_order'
  get 'orders/:id', to: 'orders#show', as: 'order_confirmation'
  get '/thank_you', to: 'orders#thank_you', as: 'thank_you'

  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  get 'home/customization', to: 'customization#index', as: 'customization'
  post 'home/customization', to: 'customization#create', as: 'create_customization'



end
