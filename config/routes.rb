Rails.application.routes.draw do
  get 'points/index'
  get 'points/new'
  get 'points/create'
  get 'points/edit'
  get 'points/update'
  get 'points/destroy'
  devise_for :clients
  root to: 'tops#index'
  
  resources :tops
  resources :products
end
