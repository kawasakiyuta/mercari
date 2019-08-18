Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :item
  resources :mypage
  get "card/create", to: "card#create"
  resources :card
  get 'mypage/indetification', to: 'mypage#identification'

end
