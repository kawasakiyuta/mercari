Rails.application.routes.draw do
  # get 'products/show'
  # get 'products/new'
  # get 'products/index'
  # get 'products/error'
  devise_for :users

  root 'products#index'
  resources :mypages, only: :index
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :purchase_confirmation
  resources :products
  get 'mypage/indetification', to: 'mypage#identification'

end
