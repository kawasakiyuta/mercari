Rails.application.routes.draw do
  devise_for :users
  resources :profile 
  resources :purchase_confirmation
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'purchase_confirmation#index'
  
end
