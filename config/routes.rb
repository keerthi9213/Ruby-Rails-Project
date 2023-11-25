# frozen_string_literal: true

Rails.application.routes.draw do
  get 'inventory_items/new'
  get 'inventory_items/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:'home#show'
  get 'home', to: 'home#show', as: 'home'
  get 'home/listings', to: 'birdhouse#listings', as: 'listings'
  get 'home/listings/:id', to: 'birdhouse#listings_show', as: 'listings_show'
  get '/home/history', to: 'users#history', as: 'history'
  resources :inventory_items, only: [:new, :create]
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
