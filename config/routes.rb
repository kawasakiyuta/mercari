Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'logout'
      get 'identification'
      get 'mypage'
    end
  end 
  
  resources :login, only: :index
  resources :sign_up, only: [:index, :new]
  resources :sign_up_new
  root 'products#index'
  get 'products/error' => 'products#error'
  resources :products
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  get "card/create", to: "card#create"
  resources :card
  resources :purchase_confirmation
  resources :items

end
