Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  
end
