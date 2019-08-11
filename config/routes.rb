Rails.application.routes.draw do
  devise_for :users
  resources :profile 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :mypages, only: :index
end
