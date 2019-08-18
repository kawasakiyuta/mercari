Rails.application.routes.draw do
  devise_for :users

  resources :login, only: :index
  resources :sign_up, only: [:index, :new]
  resources :sign_up_new, only: :index
  
  get 'sign_up_new/telephone', to: 'sign_up_new#telephone'
  get 'sign_up_new/address', to: 'sign_up_new#address'
  get 'sign_up_new/create', to: 'sign_up_new#create'
  get 'sign_up_new/pay', to: 'sign_up_new#pay'


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
