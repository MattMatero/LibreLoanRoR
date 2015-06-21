Rails.application.routes.draw do
  
  devise_for :user
  root 'home#index'
  
  resources :books

  get 'home/profile'
end
