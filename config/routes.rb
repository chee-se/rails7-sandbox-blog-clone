# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  devise_for :administrators, module: 'administrators'
  devise_for :users, module: 'users'

  resources :administrators
  resources :posts

  root 'posts#index'
end
