Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # devise_for :users
  devise_scope :user do
    get 'users/telephone', to: 'users/registrations#telephone'
    get 'users/address', to: 'users/registrations#address'
    get 'users/pay', to: 'users/registrations#pay'
    get 'users/complete', to: 'users/registrations#complete'
  end

  resources :users do
    collection do
      get 'identification'
      get 'mypage'
      get 'logout'
    end
  end
  root 'products#index'

  resources :login, only: [:index, :new, :create]
  resources :category, only: [:index, :show]
  resources :sign_up, only: [:index, :new]
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :purchase_confirmation ,only: [:index]
  resources :products do
    collection do
      get 'get_category_children', defaults:{ format: 'json'}
      get 'get_category_grandchildren', defaults:{ format:'json'}
      get 'error'
      get 'search'
    end
    member do
      post 'buy'
      get 'confirmation'
    end
  end

  resources :cards do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  
end
