# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :administrators, module: :administrators
  devise_for :users, module: :users

  unauthenticated do
    root 'posts#index'
  end

  authenticated :administrators do
    root 'administrators#index', as: :administrator_root
  end

  authenticated :users do
    root 'posts#index', as: :user_root
  end

  resources :administrators
  resources :posts
  resources :users

end
