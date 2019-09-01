Rails.application.routes.draw do
  get 'cards/index'
  get 'cards/show'
  get 'cards/create'
  devise_for :users

  resources :users do
    collection do
      get 'sign_up'
      get 'login'
      get 'address'
      get 'pay'
      get 'telephone'
      get 'logout'
      get 'identification'
      get 'mypage'
    end
  end

  root 'products#index'
  resources :products do
    collection do
      get 'error'
      get 'confirmation'
    end
  end
  
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  get "card/create", to: "card#create"
  resources :card
  resources :purchase_confirmation
  resources :items

end
