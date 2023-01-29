# frozen_string_literal: true

Rails.application.routes.draw do
  draw :devise
  resources :posts
  resources :users
  resources :admins

  namespace :admin do
    resources :users
  end

  root 'posts#index'
end
