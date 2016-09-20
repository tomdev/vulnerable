Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :users, only: [:edit, :update, :show]

  get 'admin', to: 'admin#index'
end
