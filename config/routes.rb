Rails.application.routes.draw do
  # devise_for :clients
  # devise_for :users
  devise_for :clients, controllers: {
    sessions:      'clients/sessions',
    passwords:     'clients/passwords',
    registrations: 'clients/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'tops#index'
  resources :events do #管理画面用
    collection do
      get 'search_words'
    end
  end 

  resources :tops
  resources :products do
    resources :points
    resources :itinerarys
    resources :events 
  end
end
