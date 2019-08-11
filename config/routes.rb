Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'login#index'
  root 'sign_up#new'

  # get 'login' => 'login#new'
  # post 'login' => 'login#create'
  
  # root 'sign_up#index'
end
