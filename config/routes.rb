Rails.application.routes.draw do
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
  get 'products/error' => 'products#error'
  resources :products
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  get "cards/create", to: "cards#create"
  resources :cards

  resources :purchase_confirmation
  resources :items

end
