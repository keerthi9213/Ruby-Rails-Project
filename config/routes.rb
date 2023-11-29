# frozen_string_literal: true

Rails.application.routes.draw do
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
  get 'home/aboutus', to: 'home#aboutus', as: 'aboutus'
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

  resources :questions, only: [:create, :show] do
    resources :answers, only: [:create]
  end

end
