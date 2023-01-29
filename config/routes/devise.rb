# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, module: 'devise/users'
  devise_for :admins, module: 'devise/admins'
end
