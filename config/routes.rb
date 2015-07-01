Rails.application.routes.draw do
  
  devise_for :user
  root 'home#index'
  
  resources :books
  resources :loans
  resources :messages do
    get 'reply', :on => :member
  end

  get 'home/profile'

  get 'home/profile/:name', to: 'home#profile'
  
end
