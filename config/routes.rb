Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  
  resources :books, only: [:new, :create, :index, :edit, :destroy]
  resources :users, only: [:new, :create, :edit, :update]
  
  devise_for :users
  
end
