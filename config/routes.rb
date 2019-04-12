# frozen_string_literal: true

Rails.application.routes.draw do
  resources :plants
  # get 'sessions/destroy'
  root to: 'pages#home'
  get '/picture' => 'pages#picture'
  get '/dashboard' => 'pages#dashboard'
  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'register' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get     '/login' => 'devise/sessions#new'
    get     '/register' => 'devise/registrations#new'
    delete '/logout' => 'devise/sessions#destroy'
  end
end
