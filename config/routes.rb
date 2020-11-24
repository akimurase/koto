Rails.application.routes.draw do

  devise_for :clients
  root to: 'tops#index'

  resources :tops
  resources :products do
    resources :points
  end
end
