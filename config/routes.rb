Rails.application.routes.draw do
  devise_for :users

  root 'products#index'
  resources :mypages, only: :index
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :purchase_confirmation
  resources :products
    collection do
      get 'error'
    end
  get 'mypage/indetification', to: 'mypage#identification'

end
