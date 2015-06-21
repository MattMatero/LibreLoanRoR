Rails.application.routes.draw do
  
  devise_for :user
  root 'home#index'
  
  resources :books
  resources :loans

  get 'home/profile'
end
