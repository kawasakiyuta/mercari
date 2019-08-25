Rails.application.routes.draw do
  devise_for :users


  resources :login, only: :index
  resources :sign_up, only: [:index, :new]
  resources :sign_up_new
  root 'items#index'
  resources :products
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
