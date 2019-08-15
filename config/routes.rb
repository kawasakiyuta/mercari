Rails.application.routes.draw do
  devise_for :users

  resources :login, only: :index
  resources :sign_up, only: [:index, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  # resources :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'items#index'
  root 'tops#index'
  root 'items#index'
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :item
  resources :mypage
  get 'mypage/indetification', to: 'mypage#identification'

end
