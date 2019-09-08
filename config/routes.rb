Rails.application.routes.draw do

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
  resources :login, only: [:index, :new, :create]
  resources :sign_up, only: [:index, :new]
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  # resources :cards,only: [:index, :show, :create]
  resources :purchase_confirmation ,only: [:index]
  resources :products,only: [:index, :show, :new] do
    collection do
      get 'error'
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

end
