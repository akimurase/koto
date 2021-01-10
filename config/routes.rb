Rails.application.routes.draw do
  devise_for :samples
  # devise_for :clients
  # devise_for :users
  # devise_for :samples, controllers: {
  #   sessions:      'samples/sessions',
  #   passwords:     'samples/passwords',
  #   registrations: 'samples/registrations'
  # }
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

  # root to: 'kototabis#index'
  root to: 'demos#home'
  get 'demos/home'
  get 'demos/about'
  get 'demos/show'
  resources :demos, only: [:index, :new, :edit, :update, :create, :destroy]
  # get 'demos/index'
  # get 'demos/new'
  # get 'demos/edit'
  # get 'demos/update'
  # get 'demos/destroy'
  get 'demos/search'
  get 'demos/search_words'

  get 'kototabis/index'
  get 'kototabis/show_top'
  get 'kototabis/show_product'
  get 'kototabis/show_about'

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
