Rails.application.routes.draw do
  devise_for :users
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :item
  resources :mypage
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'mypage/indetification', to: 'mypage#identification'

end
