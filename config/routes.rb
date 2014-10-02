Rails.application.routes.draw do
  devise_for :users

  resources :wikis

  get 'home/index'

  root to: 'home#index'
end
