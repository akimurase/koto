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

  devise_scope :client do
    post 'clients/guest_sign_in', to: 'clients/sessions#new_guest'
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end



  # root to: 'tops#index'
  root to: 'kototabi#index'
  get 'kototabi/index'
  get 'kototabi/show_about'
  # get 'kototabi/show1'
  # get 'kototabi/show2'
  get 'kototabi/show'
  # resources :kototabi, only: [:index, :show]
  resources :events do #管理画面用
    collection do
      get 'search_words'
    end
  end 
  get 'events/search' 

  resources :tops
  post 'products/add'
  resources :products do
    resources :points
    resources :itinerarys
    resources :events 
  end
end
