# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:'home#show'
  get 'home', to: 'home#show', as: 'home'
  get 'home/listings', to: 'birdhouse#listings', as: 'listings'
  get 'home/listings/:id', to: 'birdhouse#listings_show', as: 'listings_show'
  post 'home/listings/:id/add_to_cart', to: 'cart#add', as: 'add_to_cart'
  # Devise routes for user sign-in, sign-up, sign-out, etc.
  devise_for :users

end
