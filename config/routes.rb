Rails.application.routes.draw do
  get 'plans/index'
  get 'plans/new'
  get 'plans/create'
  get 'plans/edit'
  get 'plans/update'
  get 'plans/destroy'
  devise_for :clients
  root to: 'tops#index'
  
  resources :tops
  resources :products, only: [:index, :new, :create, :edit, :update, :destroy ]
end
