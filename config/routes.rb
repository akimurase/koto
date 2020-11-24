Rails.application.routes.draw do

  get 'events/index'
  get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
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
    resources :itinerarys
  end
end
