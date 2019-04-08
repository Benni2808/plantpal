# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'sessions/destroy'
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # delete '/users/sign_out',  to: 'sessions#destroy'
  get  '/logout', to: 'sessions#destroy' # process logout
end
