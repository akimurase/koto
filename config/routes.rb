Rails.application.routes.draw do

  get 'itinerarys/index'
  get 'itinerarys/new'
  get 'itinerarys/create'
  get 'itinerarys/edit'
  get 'itinerarys/update'
  get 'itinerarys/destroy'
  devise_for :clients
  root to: 'tops#index'

  resources :tops
  resources :products do
    resources :points
  end
end
