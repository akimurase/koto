Rails.application.routes.draw do
  devise_for :users
  devise_for :clients
  # devise_for :clients, controllers: {
  #   sessions:      'clients/sessions',
  #   passwords:     'clients/passwords',
  #   registrations: 'clients/registrations'
  # }
  # devise_for :users, controllers: {
  #   sessions:      'users/sessions',
  #   passwords:     'users/passwords',
  #   registrations: 'users/registrations'
  # }
  root to: 'tops#index'
  resources :events #管理画面用

  resources :tops
  resources :products do
    resources :points
    resources :itinerarys
    resources :events do
      collection do
        post :confirm
      end
    end
  end
end
