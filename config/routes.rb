Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
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
    end
  end

  root 'products#index'

  resources :login, only: [:index, :new, :create]
  resources :sign_up, only: [:index, :new]
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :cards,only: [:index, :show, :create]
  resources :purchase_confirmation ,only: [:index]
  resources :products,only: [:index, :show, :new] do
    collection do
      get 'error'
      get 'confirmation'
    end
  end

  #Google認証
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:omniauth_callbacks] = 'admin_users/omniauth_callbacks'
  devise_for :admin_users, devise_config
  ActiveAdmin.routes(self)
end
