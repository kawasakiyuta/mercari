Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      get 'login'
      get 'address'
      get 'pay'
      get 'telephone'
    end
  end

  root 'products#index'
  resources :products,only: [:index]
  resources :login, only: :index
  resources :sign_up, only: [:index, :new]
  resources :sign_up_new
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
