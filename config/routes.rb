Rails.application.routes.draw do
  devise_for :users


  resources :login, only: :index

  resources :sign_up, only: :index
  resources :sign_up_new, only: :index

  # resources :sign_up_new do
  #   collection do
  #     post :telephone
  #   end
  # end

  
  get 'sign_up_new/registration', to: 'sign_up_new#registration'
  get 'sign_up_new/telephone', to: 'sign_up_new#telephone'
  get 'sign_up_new/address', to: 'sign_up_new#address'
  get 'sign_up_new/create', to: 'sign_up_new#create'
  get 'sign_up_new/pay', to: 'sign_up_new#pay'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  # resources :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'items#index'
  root 'tops#index'

  resources :sign_up, only: [:index, :new]
  resources :sign_up_new

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
