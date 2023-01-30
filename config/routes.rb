# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :administrators, module: 'administrators'
  devise_for :users, module: 'administrators'
  resources :posts

  root 'posts#index'
end
