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
    end
  end
  get 'home/guide', to: 'home#guide', as: 'guide'
  get 'home/guide/community', to: 'home#community', as: 'community'
  get 'home/listings', to: 'birdhouse#listings', as: 'listings'
  get 'home/listings/:id', to: 'birdhouse#listings_show', as: 'listings_show'
  post 'home/listings/:id/add_to_cart', to: 'cart#add', as: 'add_to_cart'
  get 'home/cart', to: 'cart#cart', as: 'cart'
  get 'home/cart/:id', to: 'cart#buy', as: 'buy_now'
  get 'home/aboutus', to: 'home#aboutus', as: 'aboutus'
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

  get 'home/guide/quiz', to: 'quizzes#new', as: 'new_quiz'
  post 'home/guide/quiz', to: 'quizzes#create', as: 'create_quiz'

  get 'history', to: 'users#history', as: 'history'

  get '/inventory', to: 'birdhouse#inventory', as: 'inventory'

  resources :questions, only: [:create, :show] do
    resources :answers, only: [:create]
  end

end
