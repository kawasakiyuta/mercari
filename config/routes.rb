Rails.application.routes.draw do
  devise_for :users
  resources :login, only: :index
  resources :sign_up, only: [:index, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end
