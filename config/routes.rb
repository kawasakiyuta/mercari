Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      get 'sign_up'
      get 'login'
      get 'address'
      get 'pay'
      get 'telephone'
      get 'create'
    end
  end

  root 'products#index'
  get 'products/error' => 'products#error'
  resources :products
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :mypage
  get "card/create", to: "card#create"
  resources :card
  resources :purchase_confirmation
  get 'mypage/indetification', to: 'mypage#identification'

end
