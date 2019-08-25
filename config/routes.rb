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

  root 'items#index'
  resources :products,only: [:index]
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :mypage
  get "card/create", to: "card#create"
  resources :card
  resources :purchase_confirmation
  resources :items
  get 'mypage/indetification', to: 'mypage#identification'

end
