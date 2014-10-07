Rails.application.routes.draw do
  devise_for :users

  resources :wikis do
    resources :collaborations, only: [:new, :create]
  end

  resources :charges, only: [:new, :create]

  get 'home/index'

  root to: 'home#index'
end
