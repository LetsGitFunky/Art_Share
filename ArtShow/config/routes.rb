Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users, except: [:edit, :new]
  # get 'users/', to: 'users#index',    as: 'users'
  # post 'users/', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :users, except: [:edit, :new] do
    resources :comments, only: [:index]
    resources :artworks, only: [:index]
  end
  resources :artworks, except: [:edit, :new] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

  # get '/users/:user_id/artworks', to: 'artworks#index', as: "artworks_for_user_id"
end
